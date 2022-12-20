import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universe_store/app/models/login_user.dart';
import 'package:universe_store/app/models/user.dart';
import 'package:universe_store/app/modules/account/account_state.dart';
import 'package:universe_store/app/modules/global_store.dart';
import 'package:universe_store/app/service/woocomerce/woo_service.dart';

class AccountStore extends StreamStore<Exception, AccountState> {
  AccountStore() : super(AcocuntInitState());
  final WooService _wooService = WooService();
  GlobalStore globalStore = Modular.get<GlobalStore>();
  Future gets() async {
    update(AccountDataState(
        currentCustomer: globalStore.currentCustomer,
        currentUser: globalStore.currentUser));
    
    return {};
  }
}
