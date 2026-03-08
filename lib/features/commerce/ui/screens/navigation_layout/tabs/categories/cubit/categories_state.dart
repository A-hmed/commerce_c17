import 'package:route_e_commerce_v2/core/utils/resource.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/category.dart';

class CategoriesState {
  late int selectedCategoryIndex = 0;
  late Resource<List<Category>> categoriesApi;
  late Resource<List<Category>> subCategoriesApi;

  CategoriesState.initial() {
    selectedCategoryIndex = 0;
    categoriesApi = Resource.initial();
    subCategoriesApi = Resource.initial();
  }

  CategoriesState({
    required this.selectedCategoryIndex,
    required this.categoriesApi,
    required this.subCategoriesApi,
  });

  CategoriesState copyWith({
    int? selectedCategoryIndex,
    Resource<List<Category>>? categoriesApi,
    Resource<List<Category>>? subCategoriesApi,
  }) {
    return CategoriesState(
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      categoriesApi: categoriesApi ?? this.categoriesApi,
      subCategoriesApi: subCategoriesApi ?? this.subCategoriesApi,
    );
  }
}
