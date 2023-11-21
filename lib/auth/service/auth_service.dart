import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:task/auth/model/login_request_model.dart';
import 'package:task/auth/model/user_model.dart';
import 'package:task/utils/endpoint/api_endpoint.dart';

class AuthService {
  Future<User> doLogin(LoginRequest request) async {
    try {
      var response = await Dio().post(
        ApiEndPoint.login,
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {'content-Type': 'application/json'},
        ),
      );

      if (kDebugMode) {
        print(response.toString());
      }
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      String errorMsg = "Something went wrong";
      if (e is DioException) {
        errorMsg = e.response?.data['message'] ?? errorMsg;
      }
      throw errorMsg;
    }
  }
}
