import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/screens/navigation_layout/tabs/categories/categories_tab_view.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/screens/navigation_layout/tabs/favorites/favorite_tab_view.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/screens/navigation_layout/tabs/home/cubit/home_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/screens/navigation_layout/tabs/home/home_tab_view.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/screens/navigation_layout/tabs/profile/profile_tab_view.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/widgets/home_appbar.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/widgets/home_bottom_navigation_bar_item.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  ValueNotifier<int> index = ValueNotifier(0);
  var homeCubit = getIt<HomeCubit>();

  @override
  void initState() {
    super.initState();
    homeCubit.loadCategories();
    homeCubit.loadProducts();
  }

  List<Widget> pages = [
    const HomeTabView(),
    const CategoriesTabView(),
    const FavoriteTabView(),
    const ProfileTabView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => homeCubit,
      child: ValueListenableBuilder(
        valueListenable: index,
        builder:
            (context, value, child) => Scaffold(
              appBar: HomeAppbar(tabIndex: index.value),
              body: pages[value],
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: BottomNavigationBar(
                  backgroundColor: AppColors.blue,
                  type: BottomNavigationBarType.fixed,
                  onTap: changeSelectedIndex,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: [
                    HomeBottomNavigationBarItem(
                      icon: Iconsax.home_outline,
                      isSelected: value == 0,
                    ),
                    HomeBottomNavigationBarItem(
                      icon: Iconsax.category_outline,
                      isSelected: value == 1,
                    ),
                    HomeBottomNavigationBarItem(
                      icon: Iconsax.heart_outline,
                      isSelected: value == 2,
                    ),
                    HomeBottomNavigationBarItem(
                      icon: Iconsax.user_outline,
                      isSelected: value == 3,
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  void changeSelectedIndex(int value) {
    if (value == index.value) return;
    index.value = value;
  }
}
