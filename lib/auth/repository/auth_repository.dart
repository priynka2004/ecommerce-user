import 'package:task/auth/model/login_request_model.dart';
import 'package:task/auth/service/auth_service.dart';

import '../model/user_model.dart';

class AuthRepository {
  AuthService authService;

  AuthRepository(this.authService);

  Future<User> doLogin(LoginRequest request) {
    return authService.doLogin(request);
  }
}
