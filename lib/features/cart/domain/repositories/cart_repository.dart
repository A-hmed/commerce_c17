import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/new_cart.dart';

abstract class CartRepository {
  Future<ApiResult<NewCart>> getCart();

  Future<ApiResult<NewCart>> addProductToCart(String productId);

  Future<ApiResult<NewCart>> removeProductFromCart(String productId);

  Future<ApiResult<NewCart>> updateQuantityInCart(
    String productId,
    int quantity,
  );
}
