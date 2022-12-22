import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universe_store/app/models/product.dart';
import 'package:universe_store/app/models/sign_up.dart';
import 'package:universe_store/app/modules/global_store.dart';
import 'package:universe_store/app/modules/products/product_detail_page.dart';
import 'package:universe_store/app/modules/root/root_page.dart';
import 'package:universe_store/app/modules/sign_in/sign_in_page.dart';
import 'package:universe_store/app/modules/sign_in/sign_in_store.dart';
import 'package:universe_store/app/modules/sign_up/sign_up_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.instance<http.Client>(http.Client()),
    Bind.singleton((i) => GlobalStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const SignInPage()),
    ChildRoute('/root', child: (_, args) => const RootPage()),
    ChildRoute('/signup', child: (_, args) => const SignUpPage()),
    ChildRoute('/detail',
        child: (_, args) => ProductDetailPage(
              product: args.data as Product,
            )),
  ];
}
