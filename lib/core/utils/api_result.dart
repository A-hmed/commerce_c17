import 'package:route_e_commerce_v2/core/utils/app_errors.dart';

sealed class ApiResult<T> {
  bool get isSuccess => this is SuccessApiResult;

  bool get isError => this is ErrorApiResult;

  AppErrors get error => (this as ErrorApiResult).errors;

  T? getData() => (this as SuccessApiResult<T>).data;
}

class SuccessApiResult<T> extends ApiResult<T> {
  T? data;

  SuccessApiResult(this.data);
}

class ErrorApiResult<T> extends ApiResult<T> {
  AppErrors errors;

  ErrorApiResult(this.errors);
}
