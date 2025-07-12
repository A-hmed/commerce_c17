import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/widgets/custom_product_card.dart';
import 'package:route_e_commerce_v2/features/products/domain/entity/product.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  List<Product> _generateProducts() {
    List<Product> products = [];
    for (int i = 1; i <= 50; i++) {
      products.add(
        Product(
          id: '$i',
          title: 'Softride Enzo NXT',
          description: 'Sole Material: Rubber, Colour: RED, Department: Men',
          price: 2999,
          priceAfterDiscount: 2699,
          imageCover:
              'https://ecommerce.routemisr.com/Route-Academy-products/1680399913757-cover.jpeg',
          images: [
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913850-1.jpeg',
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913851-4.jpeg',
            'https://ecommerce.routemisr.com/Route-Academy-products/1680399913850-2.jpeg',
          ],
          categoryId: '6439d5b90049ad0b52b90048',
          brandId: '64089d5c24b25627a253159f',
          ratingsAverage: 2.8 + (i % 5) * 0.1,
          ratingsQuantity: 20 + i,
          quantity: 100 + i,
          availableColors: ['Red', 'Black', 'Blue'],
        ),
      );
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> products = _generateProducts();
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 240,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemExtent: 186,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CustomProductCard(product: products[index]),
            );
          },
        ),
      ),
    );
  }
}
