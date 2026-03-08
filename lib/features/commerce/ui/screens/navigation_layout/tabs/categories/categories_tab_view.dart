import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/category.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/screens/navigation_layout/tabs/categories/cubit/categories_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/screens/navigation_layout/tabs/categories/cubit/categories_state.dart';

class CategoriesTabView extends StatefulWidget {
  const CategoriesTabView({super.key});

  @override
  State<CategoriesTabView> createState() => _CategoriesTabViewState();
}

class _CategoriesTabViewState extends State<CategoriesTabView> {
  var cubit = getIt<CategoriesCubit>();

  @override
  void initState() {
    cubit.loadCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state.categoriesApi.isSuccess) {
            var categories = state.categoriesApi.data ?? [];
            return buildCategoriesTabs(categories, state);
          } else if (state.categoriesApi.isError) {
            return Text(state.categoriesApi.errorMessage!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Row buildCategoriesTabs(List<Category> categories, CategoriesState state) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: const EdgeInsets.all(12),
            child: NavigationRail(
              backgroundColor: const Color(0xffEDF1F5),
              selectedLabelTextStyle: const TextStyle(
                color: AppColors.darkBlue,
                fontWeight: FontWeight.bold,
              ),
              extended: true,
              minWidth: 10,
              destinations: categories.map((cateogry) {
                return NavigationRailDestination(
                  icon: Container(),
                  label: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(cateogry.name!),
                  ),
                );
              }).toList(),
              onDestinationSelected: (index) {
                cubit.selectSubCategory(index);
              },
              selectedIndex: state.selectedCategoryIndex,
            ),
          ),
        ),
        buildSubCategoriesGrid(),
      ],
    );
  }

  buildSubCategoriesGrid() {
    return Expanded(
      flex: 6,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state.subCategoriesApi.isSuccess) {
            var categories = state.subCategoriesApi.data ?? [];
            return GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                   border: Border.all(color: AppColors.blue)
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          AppSvgs.inactiveFavoriteIcon,
                          height: 70,
                          width: 70,
                        ),
                      ),
                      Text(categories[index].name ?? "", style: TextStyle(color: AppColors.blue, fontSize: 12)),
                    ],
                  ),
                );
              },
            );
          } else if (state.subCategoriesApi.isError) {
            return Text(state.subCategoriesApi.errorMessage!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
