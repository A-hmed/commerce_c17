import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:route_e_commerce_v2/core/constants/api_constants.dart';
import 'package:route_e_commerce_v2/core/utils/shared_prefs_utils.dart';
import 'package:route_e_commerce_v2/features/network/interceptors/auth_interceptor.dart';

@module
abstract class GetItModule {
  @singleton
  Connectivity createConnectivity() => Connectivity();

  @singleton
  Dio createDio() {
    var dio = Dio(
      BaseOptions(baseUrl: ApiConstants.baseUrl)
    );
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    dio.interceptors.add(AuthInterceptor());
    return dio;
  }
}
