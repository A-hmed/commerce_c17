import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/category.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/repositories/home_repo.dart';

@injectable
class GetSubCategoriesUseCase {
  final HomeRepo _homeRepo;

  GetSubCategoriesUseCase(this._homeRepo);

  Future<ApiResult<List<Category>>> call(String categoryId) =>
      _homeRepo.getSubCategories(categoryId);
}
