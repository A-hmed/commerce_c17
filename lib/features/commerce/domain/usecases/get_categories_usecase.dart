import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/category.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/repositories/home_repo.dart';

@injectable
class GetCategoriesUseCase {
  final HomeRepo _homeRepo;

  GetCategoriesUseCase(this._homeRepo);

  Future<ApiResult<List<Category>>> call() => _homeRepo.getCategories();
}
