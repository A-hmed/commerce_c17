import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/entities/category.dart';
import 'category_widget.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  List<Category> _generateCategories() {
    List<Category> categories = [];
    for (int i = 1; i <= 50; i++) {
      categories.add(
        Category(
          id: i.toString(),
          name: 'SuperMarket',
          image:
              'https://ecommerce.routemisr.com/Route-Academy-categories/1681511452254.png',
        ),
      );
    }
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = _generateCategories();
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            return CategoryWidget(category: categories[index]);
          },
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
        ),
      ),
    );
  }
}
