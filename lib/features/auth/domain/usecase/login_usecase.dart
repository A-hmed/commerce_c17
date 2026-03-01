import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repositories/auth_repo.dart';
import 'package:route_e_commerce_v2/features/network/models/request/login_request.dart';

@injectable
class LoginUsecase {
  AuthRepo _authRepo;

  LoginUsecase(this._authRepo);

  Future<ApiResult<void>> call(LoginRequest request) =>
      _authRepo.login(request);
}
