import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:universe_store/app/models/login_user.dart';

import 'sign_in_state.dart';

class SignInStore extends StreamStore<Exception, SignInModel> {
  SignInStore() : super(SignInInitState());

  Future signIn() async {
    setLoading(true);
    LoginUser loginUser = LoginUser(username: state.usernameController.text, password: state.pwdController.text);
    await Future.delayed(const Duration(milliseconds: 300));
    update(SignInSuccess(user: loginUser));
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
