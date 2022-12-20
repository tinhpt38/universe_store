import 'package:universe_store/app/models/login_user.dart';
import 'package:universe_store/app/models/user.dart';

abstract class AccountState {
  WPUser? currentUser;
  User? currentCustomer;
  AccountState({this.currentUser, this.currentCustomer});
}

class AcocuntInitState extends AccountState {}

class AccountDataState extends AccountState {
  AccountDataState({WPUser? currentUser, User? currentCustomer})
      : super(currentCustomer: currentCustomer, currentUser: currentUser);
}
