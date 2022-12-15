import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:universe_store/app/modules/root/root_page.dart';
import 'package:universe_store/app/modules/sign_in/sign_in_page.dart';
import 'package:universe_store/app/modules/sign_in/sign_in_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.instance<http.Client>(http.Client()),
    // $SignInStore,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const SignInPage()),
    ChildRoute('/root', child: (_, args) => const RootPage()),
  ];
}