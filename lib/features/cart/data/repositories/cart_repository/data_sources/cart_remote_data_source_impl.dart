import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/core/utils/app_errors.dart';
import 'package:route_e_commerce_v2/features/cart/data/models/cart_response.dart';
import 'package:route_e_commerce_v2/features/cart/data/repositories/cart_repository/data_sources/cart_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/network/api_client/api_client.dart';
import 'package:route_e_commerce_v2/features/network/models/request/Add_to_cart_request.dart';
import 'package:route_e_commerce_v2/features/network/models/request/update_quantity_request.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final ApiClient _apiClient;

  CartRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<CartResponse>> addProductToCart(String productId) async {
    try {
      var response = await _apiClient.addToCart(AddToCartRequest(productId: productId));
      var response2 =  await getCart();
      print("20- response2: ${response2}");
      return response2;
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }

  @override
  Future<ApiResult<CartResponse>> getCart() async {
    try {
      var response = await _apiClient.getCart();
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }

  @override
  Future<ApiResult<CartResponse>> removeProductFromCart(
    String productId,
  ) async {
    try {
      var response = await _apiClient.removeFromCart(productId);
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }

  @override
  Future<ApiResult<CartResponse>> updateQuantityInCart(
    String productId,
    int quantity,
  ) async {
    try {
      var response = await _apiClient.updateCartQuantity(productId, UpdateQuantityRequest(count: quantity));
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(ApiError());
    }
  }
}
