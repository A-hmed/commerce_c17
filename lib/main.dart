import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/app_router.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_theme.dart';
import 'package:route_e_commerce_v2/core/utils/shared_prefs_utils.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/screen/cart_cubit/cart_cubit.dart';

import 'core/di/di.dart';

void main() async {
  initDependencies();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  var isLoggedIn = (await getIt<SharedPrefsUtils>().getToken())?.isNotEmpty ?? false;

  runApp(BlocProvider(
      create: (_) => getIt<CartCubit>(),
      child: MyApp(isLoggedIn: isLoggedIn)));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Route E-Commerce",
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale("en"),
      theme: AppTheme.getLightThemeData(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: isLoggedIn ? Routes.navigationRoute : Routes.loginRoute,
    );
  }
}

///Widget -> ViewModel -> UseCase -> Repository -> Datasource
