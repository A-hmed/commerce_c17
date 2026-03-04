import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/features/network/models/response/category/categories_response.dart';
import 'package:route_e_commerce_v2/features/network/models/response/products/products_response.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<CategoriesResponse>> getCategories();

  Future<ApiResult<ProductsResponse>> getProducts();

  Future<ApiResult<CategoriesResponse>> getSubCategories(String categoryId);
}
