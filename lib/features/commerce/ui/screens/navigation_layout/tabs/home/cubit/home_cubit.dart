import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/resource.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/usecases/get_categories_usecase.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/usecases/get_products_usecase.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/screens/navigation_layout/tabs/home/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUseCase _categoriesUseCase;
  final GetProductsUseCase _productsUseCase;

  HomeCubit(this._productsUseCase, this._categoriesUseCase)
    : super(HomeState.initial());

  loadCategories() async {
    emit(state.copyWith(categoriesApi: Resource.loading()));
    var apiResult = await _categoriesUseCase();
    if (apiResult.isSuccess) {
      emit(
        state.copyWith(categoriesApi: Resource.success(apiResult.getData())),
      );
    } else {
      emit(
        state.copyWith(categoriesApi: Resource.error(apiResult.error.message)),
      );
    }
  }

  loadProducts() async {
    emit(state.copyWith(productsApi: Resource.loading()));
    var apiResult = await _productsUseCase();
    if (apiResult.isSuccess) {
      emit(state.copyWith(productsApi: Resource.success(apiResult.getData())));
    } else {
      emit(
        state.copyWith(productsApi: Resource.error(apiResult.error.message)),
      );
    }
  }
}
