import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/features/network/models/request/login_request.dart';

import '../../../../../network/models/request/register_request.dart';
import '../../../../../network/models/response/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResult<AuthResponse>> login(LoginRequest request);

  Future<ApiResult<AuthResponse>> register(RegisterRequest request);
}
