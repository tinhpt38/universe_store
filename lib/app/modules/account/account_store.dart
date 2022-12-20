import 'dart:convert';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universe_store/app/models/login_user.dart';
import 'package:universe_store/app/models/user.dart';
import 'package:universe_store/app/modules/account/account_state.dart';
import 'package:universe_store/app/service/woocomerce/woo_service.dart';

class AccountStore extends StreamStore<Exception, AccountState> {
  AccountStore() : super(AcocuntInitState());
  final WooService _wooService = WooService();
  Future gets() async {
    setLoading(false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = prefs.getString("currentUser")!;
    WPUser user = WPUser.fromJson(json.decode(stringUser));
    User? customer = await _wooService.retrieveCustomer(user.id);
    update(AccountDataState(currentCustomer: customer, currentUser: user));
    setLoading(false);
    return {};
  }
}
