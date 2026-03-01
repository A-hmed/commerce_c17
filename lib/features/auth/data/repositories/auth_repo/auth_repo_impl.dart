import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/core/utils/app_errors.dart';
import 'package:route_e_commerce_v2/core/utils/extensions/connectivity_extension.dart';
import 'package:route_e_commerce_v2/features/auth/data/repositories/auth_repo/data_sources/auth_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/auth/domain/repositories/auth_repo.dart';
import 'package:route_e_commerce_v2/features/network/models/request/login_request.dart';
import 'package:route_e_commerce_v2/features/network/models/request/register_request.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  Connectivity connectivity;

  AuthRepoImpl(this.authRemoteDataSource, this.connectivity);

  @override
  Future<ApiResult<void>> login(LoginRequest request) async {
    if (await connectivity.isConnected()) {
      return authRemoteDataSource.login(request);
    } else {
      return ErrorApiResult(NetworkError());
    }
  }

  @override
  Future<ApiResult<void>> register(RegisterRequest request) async {
    if (await connectivity.isConnected()) {
      return authRemoteDataSource.register(request);
    } else {
      return ErrorApiResult(NetworkError());
    }
  }
}
