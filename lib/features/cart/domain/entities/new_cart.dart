import 'package:route_e_commerce_v2/features/cart/domain/entities/cart_product_entity.dart';

class NewCart {
  Map<String,CartProduct> products;
  double totalCartPrice;

  NewCart({required this.products, required this.totalCartPrice});
}
