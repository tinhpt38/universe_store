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

/// route || routes -> rút 
/// router  -> râu tơ
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
/// Project Architecture  || Kiến trúc project
///  values// định nghĩa các biến dùng lại, các biến chung
/// utils // định nghĩa các hàm hỗ trợ 
/// services // các dịch vụ ví dự như goi api ... 
/// compoents // nơi chứa các giao diện dùng lại
/// core // nơi định nghĩa các thành phần quan trọng, cốt lõi trong dự án 
/// models // nơi định nghĩa các lớp dữ liệu trong project
/// modules // nơi định nghĩa, xây dựng các thành phần tương tác người dùng
