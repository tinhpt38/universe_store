import 'package:flutter/material.dart';
import 'package:universe_store/app/models/sign_up.dart';

import '../../models/login_user.dart';
import '../../models/user.dart';

abstract class SignupState {
  SignUp? signupUser;
  Customer? user;
  TextEditingController lnController = TextEditingController();
  TextEditingController fnController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();

  SignupState({this.signupUser, this.user});
}

class SignupInitState extends SignupState {
  SignupInitState();
}

class SignupFail extends SignupState {
  SignupFail(SignUp user)
      : super(
          signupUser: user,
        );
}

class SignupSuccess extends SignupState {
  SignupSuccess(Customer user)
      : super(
          user: user,
        );
}
