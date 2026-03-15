import 'package:route_e_commerce_v2/features/cart/domain/entities/cart_entity.dart';

import 'remote_cart.dart';

class CartResponse {
  String? status;
  int? numOfCartItems;
  String? cartId;
  RemoteCart? cart;

  CartResponse({this.status, this.numOfCartItems, this.cartId, this.cart});

  CartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    cart = json['data'] != null ? RemoteCart.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['numOfCartItems'] = numOfCartItems;
    data['cartId'] = cartId;
    if (this.cart != null) {
      data['data'] = this.cart!.toJson();
    }
    return data;
  }

  CartEntity toEntity() {
    return CartEntity(
      cartId: cartId,
      data: cart?.toEntity(),
      numOfCartItems: numOfCartItems,
      status: status,
    );
  }
}
