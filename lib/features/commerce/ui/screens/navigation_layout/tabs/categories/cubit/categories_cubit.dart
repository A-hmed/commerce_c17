import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/resource.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/usecases/get_categories_usecase.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/usecases/get_sub_categories_usecase.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/screens/navigation_layout/tabs/categories/cubit/categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  GetCategoriesUseCase _getCategoriesUseCase;
  GetSubCategoriesUseCase _getSubCategoriesUseCase;

  CategoriesCubit(this._getCategoriesUseCase, this._getSubCategoriesUseCase)
    : super(CategoriesState.initial());

  loadCategories() async {
    emit(state.copyWith(categoriesApi: Resource.loading()));
    var apiResult = await _getCategoriesUseCase();
    if (apiResult.isSuccess) {
      emit(
        state.copyWith(categoriesApi: Resource.success(apiResult.getData())),
      );
      selectSubCategory(0);
    } else {
      emit(
        state.copyWith(categoriesApi: Resource.error(apiResult.error.message)),
      );
    }
  }

  selectSubCategory(int index) async {
    emit(
      state.copyWith(
        subCategoriesApi: Resource.loading(),
        selectedCategoryIndex: index,
      ),
    );
    if (!state.categoriesApi.isSuccess) return;
    var apiResult = await _getSubCategoriesUseCase(
      state.categoriesApi.data![index].id!,
    );
    if (apiResult.isSuccess) {
      emit(
        state.copyWith(subCategoriesApi: Resource.success(apiResult.getData())),
      );
    } else {
      emit(
        state.copyWith(
          subCategoriesApi: Resource.error(apiResult.error.message),
        ),
      );
    }
  }
}
