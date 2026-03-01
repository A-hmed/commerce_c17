import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repositories/auth_repo.dart';

import '../../../../core/utils/api_result.dart';
import '../../../network/models/request/login_request.dart';

@injectable
class RegisterUsecase {
  AuthRepo _authRepo;

  RegisterUsecase(this._authRepo);

  Future<ApiResult<void>> call(LoginRequest request) =>
      _authRepo.login(request);
}
