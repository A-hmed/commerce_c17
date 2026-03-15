import 'package:dio/dio.dart';
import 'package:route_e_commerce_v2/core/utils/shared_prefs_utils.dart';

class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "token": await SharedPrefsUtils().getToken()
    });
    super.onRequest(options, handler);
  }
  // @override
  // void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
  //   // TODO: implement onResponse
  //   super.onResponse(response, handler);
  // }
  //
  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   super.onError(err, handler);
  // }

}