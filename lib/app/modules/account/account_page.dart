import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:universe_store/app/components/formal_button.dart';
import 'package:universe_store/app/modules/account/account_state.dart';
import 'package:universe_store/app/modules/account/account_store.dart';
import 'package:universe_store/app/values/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final AccountStore _store = AccountStore();

  @override
  void initState() {
    super.initState();
    _store.gets();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: AppColors.primaryText),
        ),
      ),
      body: ScopedBuilder<AccountStore, Exception, AccountState>(
        store: _store,
        onState: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.primaryButton,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              state.currentCustomer?.avatarUrl ?? ""),
                          radius: 58,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${state.currentCustomer?.firstName} ${state.currentCustomer?.lastName}'
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: AppColors.primaryText, fontSize: 24),
                  ),
                  Text('${state.currentCustomer?.email}'),
                  FormalButton(label: "Orders", onPress: (){},),
                  FormalButton(label: "Downloads", onPress: (){},),
                  FormalButton(label: "Addresses", onPress: (){},),
                  FormalButton(label: "Account Details", onPress: (){},),
                  FormalButton(label: "Logout", onPress: (){},),
                ],
              ),
            ),
          );
        },
        onError: (context, error) => Center(child: Text(error.toString())),
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
