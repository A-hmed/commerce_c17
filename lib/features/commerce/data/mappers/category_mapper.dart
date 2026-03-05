import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/category.dart';
import 'package:route_e_commerce_v2/features/network/models/response/category/remote_category.dart';

@injectable
class CategoryMapper {
  Category toCategory(RemoteCategory remoteCategory) {
    return Category(
      id: remoteCategory.id,
      name: remoteCategory.name,
      image: remoteCategory.image,
      categoryId: remoteCategory.categoryId,
    );
  }

  List<Category> toCategories(List<RemoteCategory> categories) {
    return categories.map(toCategory).toList();
  }
}
