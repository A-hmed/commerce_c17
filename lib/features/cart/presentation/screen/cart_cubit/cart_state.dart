import 'package:route_e_commerce_v2/core/utils/resource.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/new_cart.dart';

class CartState {
  NewCart? cart;
  late Resource<NewCart> cartResource;

  CartState({this.cart, required this.cartResource});

  CartState.initial() {
    cart = null;
    cartResource = Resource.initial();
  }

  CartState copyWith({
    NewCart? cart,
    Resource<NewCart>? cartResource,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      cartResource: cartResource ?? this.cartResource,
    );
  }
}
