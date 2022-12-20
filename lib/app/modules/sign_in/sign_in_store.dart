import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universe_store/app/models/login_user.dart';
import 'package:universe_store/app/service/auth/auth_service.dart';

import 'sign_in_state.dart';

class SignInStore extends StreamStore<Exception, SignInModel> {
  SignInStore() : super(SignInInitState());
  final AuthService _authService = AuthService();
  Future signIn() async {
    setLoading(true);
    LoginUser loginUser = LoginUser(
        username: state.usernameController.text,
        password: state.pwdController.text);
    Map<String, dynamic>? error;
    WPUser? wpUser = await _authService.login(loginUser, onError: (res) {
      error = res;
    });
    if (error != null) {
      setLoading(false);
      setError(Exception(error!["message"]));
      return {};
    }
    update(SignInSuccess(user: wpUser));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("currentUser", json.encode(wpUser));
    Modular.to.pushNamedAndRemoveUntil("/root", (p0) => false);
    setLoading(false);
    return {};
  }

  Future signInWithGoogle() async {
    setLoading(true);
    await Future.delayed(const Duration(milliseconds: 300));
    setLoading(false);
    // setError(Exception('Some things went wrong'));
  }

  Future forgetPassword() async {
    setLoading(true);
    await Future.delayed(const Duration(milliseconds: 300));
    setLoading(false);
    // setError(Exception('Some things went wrong'));
  }
}
