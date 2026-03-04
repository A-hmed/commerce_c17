import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/core/utils/app_errors.dart';
import 'package:route_e_commerce_v2/features/network/api_client/api_client.dart';
import 'package:route_e_commerce_v2/features/network/models/response/category/categories_response.dart';
import 'package:route_e_commerce_v2/features/network/models/response/products/products_response.dart';

import 'home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  ApiClient _apiClient;

  HomeRemoteDataSourceImpl(this._apiClient);

  Future<ApiResult<CategoriesResponse>> getCategories() async {
    try {
      var response = await _apiClient.getCategories();
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }

  Future<ApiResult<ProductsResponse>> getProducts() async {
    try {
      var response = await _apiClient.getProducts();
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }

  Future<ApiResult<CategoriesResponse>> getSubCategories(
    String categoryId,
  ) async {
    try {
      var response = await _apiClient.getSubCategories(categoryId);
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }
}
