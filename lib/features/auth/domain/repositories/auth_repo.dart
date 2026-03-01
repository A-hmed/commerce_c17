import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/features/network/models/request/login_request.dart';
import 'package:route_e_commerce_v2/features/network/models/request/register_request.dart';

abstract class AuthRepo {
  Future<ApiResult<void>> login(LoginRequest request);

  Future<ApiResult<void>> register(RegisterRequest request);
}