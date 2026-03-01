import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/core/utils/app_errors.dart';
import 'package:route_e_commerce_v2/core/utils/shared_prefs_utils.dart';
import 'package:route_e_commerce_v2/features/network/api_client/api_client.dart';

import '../../../../../network/models/request/login_request.dart';
import '../../../../../network/models/request/register_request.dart';
import '../../../../../network/models/response/auth_response.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  ApiClient _apiClient;
  SharedPrefsUtils _sharedPrefsUtils;

  AuthRemoteDataSourceImpl(this._apiClient, this._sharedPrefsUtils);

  Future<ApiResult<AuthResponse>> login(LoginRequest request) async {
    try {
      var response = await _apiClient.login(request);
      if (response.data.token != null && response.data.user != null) {
        _sharedPrefsUtils.saveUser(response.data.user!);
        _sharedPrefsUtils.saveToken(response.data.token!);
      }

      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(UnknownErrors());
    }
  }

  Future<ApiResult<AuthResponse>> register(RegisterRequest request) async {
    try {
      var response = await _apiClient.register(request);
      if (response.data.token != null && response.data.user != null) {
        _sharedPrefsUtils.saveUser(response.data.user!);
        _sharedPrefsUtils.saveToken(response.data.token!);
      }
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(UnknownErrors());
    }
  }
}
