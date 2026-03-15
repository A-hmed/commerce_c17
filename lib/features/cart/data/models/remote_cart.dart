import 'package:route_e_commerce_v2/features/cart/domain/entities/cart.dart';

import 'remote_cart_product.dart';

class RemoteCart {
  String? id;
  String? cartOwner;
  List<RemoteCartProduct>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  RemoteCart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  RemoteCart.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <RemoteCartProduct>[];
      json['products'].forEach((v) {
        products!.add(RemoteCartProduct.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['cartOwner'] = cartOwner;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    data['totalCartPrice'] = totalCartPrice;
    return data;
  }

  Cart toEntity() {
    return Cart(
      id: id,
      cartOwner: cartOwner,
      createdAt: createdAt,
      totalCartPrice: totalCartPrice,
      updatedAt: updatedAt,
      version: v,
      products: products?.map((product) => product.toEntity()).toList(),
    );
  }
}
