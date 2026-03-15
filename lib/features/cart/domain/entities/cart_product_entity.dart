import 'package:route_e_commerce_v2/features/commerce/domain/models/product.dart';

class CartProduct {
  final int? count;
  final String? id;
  final Product? product;
  final int? price;

  CartProduct({this.count, this.id, this.product, this.price});
}
