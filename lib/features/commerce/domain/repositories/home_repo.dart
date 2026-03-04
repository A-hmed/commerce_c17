import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/category.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/product.dart';

abstract class HomeRepo {
  Future<ApiResult<List<Category>>> getCategories();

  Future<ApiResult<List<Product>>> getProducts();

  Future<ApiResult<List<Category>>> getSubCategories(String categoryId);
}
