import 'package:route_e_commerce_v2/core/utils/resource.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/category.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/product.dart';

class HomeState {
  late Resource<List<Category>> categoriesApi = Resource.initial();
  late Resource<List<Product>> productsApi = Resource.initial();

  HomeState({required this.categoriesApi, required this.productsApi});

  HomeState.initial() {
    categoriesApi = Resource.initial();
    productsApi = Resource.initial();
  }

  HomeState copyWith({
    Resource<List<Category>>? categoriesApi,
    Resource<List<Product>>? productsApi,
  }) {
    return HomeState(
      categoriesApi: categoriesApi ?? this.categoriesApi,
      productsApi: productsApi ?? this.productsApi,
    );
  }
}
