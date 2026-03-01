import 'package:route_e_commerce_v2/core/utils/resource.dart';

class LoginState {
  late Resource<void> loginApi;

  LoginState(this.loginApi);

  LoginState.initial() {
    loginApi = Resource.initial();
  }
}
