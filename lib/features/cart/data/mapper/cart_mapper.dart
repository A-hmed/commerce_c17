import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/cart/data/models/cart_response.dart';
import 'package:route_e_commerce_v2/features/cart/data/models/remote_cart_product.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/cart_product_entity.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/new_cart.dart';

@injectable
class CartMapper {
  NewCart toCart(CartResponse cartCartResponse) {
    List<RemoteCartProduct> products = cartCartResponse.cart?.products ?? [];

    Map<String, CartProduct> map = {};

    for (var remoteCartProduct in products) {
      if (remoteCartProduct.product?.id != null) {
        map.addAll({
          remoteCartProduct.product!.id!: remoteCartProduct.toEntity(),
        });
      }
    }

    return NewCart(
      products: map,
      totalCartPrice:
          (cartCartResponse.cart?.totalCartPrice)?.toDouble() ?? 0.0,
    );
  }
}
