import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/utils/dummy_data_provider.dart';
import 'package:route_e_commerce_v2/core/widgets/custom_product_card.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/product.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/screens/navigation_layout/tabs/home/cubit/home_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/ui/screens/navigation_layout/tabs/home/cubit/home_state.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 240,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.productsApi.isSuccess && state.productsApi.data != null) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.productsApi.data!.length,
                itemExtent: 186,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CustomProductCard(product: state.productsApi.data![index]),
                  );
                },
              );
            } else if (state.productsApi.isError) {
              return Text(state.productsApi.errorMessage ?? "");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
