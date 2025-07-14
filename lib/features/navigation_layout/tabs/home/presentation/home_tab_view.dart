import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';

import 'widgets/advertisements_list.dart';
import 'widgets/categories_list.dart';
import 'widgets/products_list.dart';
import 'widgets/section_title.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const AdvertisementsList(),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SectionTitle(title: locale.categories, viewAllVisibility: true),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const CategoriesList(),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        SectionTitle(title: locale.homeAppliance),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const ProductsList(),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
