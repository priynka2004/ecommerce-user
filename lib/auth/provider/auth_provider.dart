import 'package:flutter/cupertino.dart';
import 'package:task/auth/model/login_request_model.dart';
import 'package:task/auth/model/user_model.dart';
import 'package:task/auth/repository/auth_repository.dart';
import 'package:task/utils/shared_preference_service.dart';
import 'package:task/utils/app_constant.dart';

class AuthProvider extends ChangeNotifier {
  AuthRepository authRepository;

  AuthProvider(this.authRepository);

  bool isLoading = false;

  User? user;

  Future<bool> doLogin(LoginRequest request) async {
    try {
      isLoading = true;
      notifyListeners();
      User user = await authRepository.doLogin(request);
      isLoading = false;
      notifyListeners();
      await SharedPreferenceService.saveUser(user);
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      AppConstant.showToast(e.toString());
      return false;
    }
  }

  Future loadUser() async {
    user = await SharedPreferenceService.getUser();
    notifyListeners();
  }
}
