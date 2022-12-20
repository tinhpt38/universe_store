import 'package:flutter/material.dart';

import '../../models/login_user.dart';

abstract class SignInModel {
  WPUser? currentUser;
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  bool signInSuccess = false;

  SignInModel({this.currentUser, this.signInSuccess = false});
}

class SignInInitState extends SignInModel {
  SignInInitState();
}

class SignInFail extends SignInModel {
  SignInFail() : super(signInSuccess: false);
}

class SignInSuccess extends SignInModel {
  SignInSuccess({required user})
      : super(currentUser: user, signInSuccess: true);
}
