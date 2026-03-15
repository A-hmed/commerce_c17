import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/screen/cart_cubit/cart_cubit.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/screen/cart_cubit/cart_state.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/widgets/checkout_section.dart';

import '../widgets/cart_product_widget.dart';
import '../widgets/cart_screen_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartScreenAppbar(),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.cart == null || state.cart!.products == null) {
            return CircularProgressIndicator();
          } else {
            var products = state.cart!.products.values.toList();
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return CartProductWidget(
                        cartProduct: products[index],
                        colorIndex: 0,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: state.cart!.products!.length,
                  ),
                ),
                CheckoutSection(
                  totalCartPrice: state.cart!.totalCartPrice ?? 0,
                ),
                const SizedBox(height: 24),
              ],
            );
          }
        },
      ),
    );
  }
}
