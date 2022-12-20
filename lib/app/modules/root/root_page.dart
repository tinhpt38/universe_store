import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:universe_store/app/modules/account/account_page.dart';
import 'package:universe_store/app/modules/cart/cart_page.dart';
import 'package:universe_store/app/modules/global_store.dart';
import 'package:universe_store/app/modules/products/product_page.dart';
import 'package:universe_store/app/modules/whislist/whislist_page.dart';
import 'package:universe_store/app/values/colors.dart';

import '../home/home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Widget> pages = [
    const HomePage(),
    const WhisListPage(),
    const ProductsPage(),
    const CartPage(),
    const AccountPage()
  ];
  int currentIndex = 2;
  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home", Colors.blue,
        labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.favorite, "Whis", Colors.orange,
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.dashboard_rounded, "Products", Colors.orange,
        labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.store, "Cart", Colors.cyan),
    TabItem(Icons.person_pin, "Account", Colors.cyan),
  ]);
  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    _navigationController = CircularBottomNavigationController(currentIndex);
    super.initState();
    GlobalStore globalStore = Modular.get<GlobalStore>();
    globalStore.gets();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_navigationController.value ?? 0],
      bottomNavigationBar: CircularBottomNavigation(tabItems,
          barBackgroundColor: AppColors.background,
          controller: _navigationController,
          selectedPos: currentIndex, selectedCallback: (int? selectedPos) {
        setState(() {
          currentIndex = selectedPos ?? 0;
        });
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
