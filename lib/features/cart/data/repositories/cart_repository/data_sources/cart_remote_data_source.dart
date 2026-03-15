import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/features/cart/data/models/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<ApiResult<CartResponse>> getCart();

  Future<ApiResult<CartResponse>> addProductToCart(String productId);

  Future<ApiResult<CartResponse>> removeProductFromCart(String productId);

  Future<ApiResult<CartResponse>> updateQuantityInCart(
    String productId,
    int quantity,
  );
}
