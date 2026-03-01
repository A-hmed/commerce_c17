import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/utils/resource.dart';
import 'package:route_e_commerce_v2/core/utils/validation.dart';
import 'package:route_e_commerce_v2/features/auth/ui/screens/login/cubit/login_cubit.dart';
import 'package:route_e_commerce_v2/features/auth/ui/screens/login/cubit/login_state.dart';
import 'package:route_e_commerce_v2/features/auth/ui/widgets/auth_textfield.dart';

class Login extends StatelessWidget {
  Login({super.key});

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  LoginCubit cubit = getIt();

  @override
  Widget build(BuildContext context) {
    // BlocProvider(create: (_) => cubit,
    // child: BlocProvider(create: (_) => cubit,
    //   child: ,),
    // );
    // MultiBlocProvider(providers: [
    //   BlocProvider(create: (_) => cubit),
    //   BlocProvider(create: (_) => cubit),
    // ],
    //     child: Widget);
    return BlocListener<LoginCubit, LoginState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.loginApi.status == ApiStatus.success) {
          Navigator.pushNamed(context, Routes.navigationRoute);
        } else if (state.loginApi.status == ApiStatus.error) {
          Fluttertoast.showToast(
            msg: state.loginApi.errorMessage ?? "",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blue,
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(AppImages.logo),
                    const SizedBox(height: 80),

                    Text(
                      AppLocalizations.of(context)!.welcomeBackToRoute,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: AppColors.white),
                    ),

                    Text(
                      AppLocalizations.of(context)!.pleaseSignInWithYourMail,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 40),

                    AuthTextField(
                      title: AppLocalizations.of(context)!.enterYourMail,
                      hintText: AppLocalizations.of(context)!.mail,
                      validator: Validation.validateEmail,
                      controller: emailController,
                    ),
                    SizedBox(height: 40),

                    AuthTextField(
                      title: AppLocalizations.of(context)!.enterYourPassword,
                      hintText: AppLocalizations.of(context)!.password,
                      validator: Validation.validatePassword,
                      obscureText: true,
                      controller: passwordController,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // TODO:  Navigate to forget password
                          },
                          child: Text(
                            AppLocalizations.of(context)!.forgetPassword,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 56),
                    BlocBuilder<LoginCubit, LoginState>(
                      bloc: cubit,

                      ///Instead of adding bloc provider
                      builder: (context, state) {
                        if (!state.loginApi.isLoading) {
                          return ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                print("email: ${emailController.text}");
                                cubit.login(
                                  emailController.text,
                                  passwordController.text,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.signIn,
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: AppColors.darkBlue),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: AppColors.white,
                            ),
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 32),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dontHaveAnAccount,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO:  Navigate to create account
                          },

                          child: Text(
                            AppLocalizations.of(context)!.createAccount,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
