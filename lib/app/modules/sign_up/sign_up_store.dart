import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:universe_store/app/models/login_user.dart';
import 'package:universe_store/app/models/sign_up.dart';
import 'package:universe_store/app/models/user.dart';
import 'package:universe_store/app/modules/sign_up/sign_up_state.dart';

import '../../service/woocomerce/woo_service.dart';

class SignupStore extends StreamStore<Exception, SignupState> {
  SignupStore() : super(SignupInitState());

  final WooService _wooService = WooService();
  Future signUp() async {
    setLoading(true);
    SignUp signup = SignUp(
        email: state.emailController.text,
        firstName: state.fnController.text,
        lastName: state.lnController.text,
        password: state.pwdController.text);
      Map<String, dynamic>? response;
    User? user = await _wooService.createCustomer(signup, (error) {
      response = error;
    });
    if (user == null && response != null) {
      update(SignupFail(signup));
      setLoading(false);
      setError(Exception(response!["message"]));
      return {};
    }
    update(SignupSuccess(user!));
    setLoading(false);
    return {};
  }
}
