import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:universe_store/app/modules/account/account_page.dart';
import 'package:universe_store/app/modules/products/product_page.dart';
import 'package:universe_store/app/modules/whislist/whislist_page.dart';

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
    const AccountPage()
  ];
  int currentIndex = 0;
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
  final CircularBottomNavigationController _navigationController =
      CircularBottomNavigationController(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_navigationController.value ?? 0],
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        controller: _navigationController,
      ),
    );
  }
}
