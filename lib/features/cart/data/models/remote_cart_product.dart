import 'package:route_e_commerce_v2/features/cart/domain/entities/cart_product_entity.dart';
import 'package:route_e_commerce_v2/features/commerce/data/mappers/product_mapper.dart';
import 'package:route_e_commerce_v2/features/network/models/response/products/remote_product.dart';

class RemoteCartProduct {
  int? count;
  String? id;
  RemoteProduct? product;
  int? price;

  RemoteCartProduct({this.count, this.id, this.product, this.price});

  RemoteCartProduct.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? RemoteProduct.fromJson(json['product']) : null;
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['_id'] = id;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['price'] = price;
    return data;
  }

  CartProduct toEntity() {
    return CartProduct(
      count: count,
      id: id,
      price: price,
      product: product?.toProduct(),
    );
  }
}
