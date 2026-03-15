import 'package:route_e_commerce_v2/features/commerce/domain/models/product.dart';

class Wishlist {
  final int? count;
  final List<Product>? products;

  Wishlist({this.count, this.products});
}
