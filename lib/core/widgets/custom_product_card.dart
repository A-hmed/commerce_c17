import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/screen/cart_cubit/cart_cubit.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/screen/cart_cubit/cart_state.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/product.dart';

class CustomProductCard extends StatelessWidget {
  final Product product;

  const CustomProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: .3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        product.imageCover ??
                        'https://ecommerce.routemisr.com/Route-Academy-products/1678303324588-cover.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title ?? 'Unknown Product',
                        style: textTheme.headlineSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      Text(
                        product.description ?? 'No description available',
                        style: textTheme.headlineSmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EGP ${product.priceAfterDiscount ?? 0} ',
                            style: textTheme.headlineSmall,
                          ),
                          Text(
                            " ${product.price ?? 0}",
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: colorScheme.primary.withValues(
                                    alpha: .6,
                                  ),
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 4,
                            children: [
                              Text(
                                'Review (${product.ratingsAverage?.toStringAsFixed(1) ?? 0})',
                                style: textTheme.headlineSmall,
                              ),
                              SvgPicture.asset(AppSvgs.ratingIcon),
                            ],
                          ),
                          buildCartActionButton(colorScheme),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                //TODO: Implement favorite toggle functionality
              },
              child: CircleAvatar(
                backgroundColor: colorScheme.onPrimary,
                child: SvgPicture.asset(
                  AppSvgs.inactiveFavoriteIcon,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCartActionButton(ColorScheme colorScheme) {
    CartCubit cubit = getIt();

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            if (cubit.isProductInCart(product.id!)) {
              cubit.removeFromCart(product.id!);
            } else {
              cubit.addToCart(product.id!);
            }
          },
          style: IconButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            visualDensity: VisualDensity.compact,
            shape: const CircleBorder(),
          ),
          icon: Icon(
            cubit.isProductInCart(product.id!)
                ? Icons.remove_rounded
                : Icons.add_rounded,
          ),
        );
      },
    );
  }
}
