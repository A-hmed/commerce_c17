import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/resource.dart';
import 'package:route_e_commerce_v2/features/auth/domain/usecase/login_usecase.dart';
import 'package:route_e_commerce_v2/features/auth/ui/screens/login/cubit/login_state.dart';
import 'package:route_e_commerce_v2/features/network/models/request/login_request.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUsecase) : super(LoginState.initial());

  LoginUsecase _loginUsecase;

  void login(String email, String password) async {
    emit(LoginState(Resource.loading()));
    var result = await _loginUsecase(
      LoginRequest(email: email, password: password),
    );
    if (result.isSuccess) {
      emit(LoginState(Resource.success(null)));
    } else {
      // emit(LoginState(Resource.error((result as ErrorApiResult).errors.message)));
      emit(LoginState(Resource.error(result.error.message)));
    }
  }
}
