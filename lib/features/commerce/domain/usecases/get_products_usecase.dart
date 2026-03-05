import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/product.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/repositories/home_repo.dart';

@injectable
class GetProductsUseCase {
  final HomeRepo _homeRepo;

  GetProductsUseCase(this._homeRepo);

  Future<ApiResult<List<Product>>> call() => _homeRepo.getProducts();
}
