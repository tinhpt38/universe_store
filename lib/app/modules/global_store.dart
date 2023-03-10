import 'dart:convert';
import 'dart:math';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universe_store/app/models/cart.dart';
import 'package:universe_store/app/models/login_user.dart';
import 'package:universe_store/app/models/product.dart';
import 'package:universe_store/app/models/user.dart';
import 'package:universe_store/app/service/woocomerce/woo_service.dart';

part 'global_store.g.dart';

class GlobalStore = _GlobalStore with _$GlobalStore;

abstract class _GlobalStore with Store {
  @observable
  ObservableList<Cart> carts = ObservableList<Cart>();

  @observable
  ObservableList<Product> products = ObservableList<Product>();
  @observable
  WPUser? currentUser;
  @observable
  Customer? currentCustomer;

  late SharedPreferences prefs;

  @action
  gets() async {
    prefs = await SharedPreferences.getInstance();
    String stringUser = prefs.getString("currentUser")!;
    currentUser = WPUser.fromJson(json.decode(stringUser));
    currentCustomer = await WooService().retrieveCustomer(currentUser!.id);
    String? rawVals = prefs.getString("carts");
    if (rawVals != null) {
      carts = decodeCart(rawVals);
    }
  }

  @action
  addCart(int pid, Product product) {
    int cartIndex = carts.indexWhere((element) {
      return pid == element.pId;
    });
    if (cartIndex > -1) {
      carts[cartIndex].quantity += 1;
    } else {
      Cart cart = Cart(
          pId: pid,
          quantity: 1,
          customerId: currentCustomer!.id,
          createdAt: DateTime.now(),
          product: product);

      carts.add(cart);
    }
    prefs.setString("carts", encodeCart());
  }

  String encodeCart() {
    List<Map<String, dynamic>> values =
        carts.map((element) => element.toJson()).toList();
    return json.encode(values);
  }

  ObservableList<Cart> decodeCart(String rawVals) {
    List<dynamic> values = json.decode(rawVals);
    List<Cart> tcarts = values.map((e) => Cart.fromJson(e)).toList();
    return ObservableList<Cart>.of(tcarts);
  }

  @action
  incrementQty(int pId, int qtyAdd) {
    int cartIndex = carts.indexWhere((element) {
      return pId == element.pId;
    });
    if (cartIndex > -1) {
      carts[cartIndex].quantity += qtyAdd;
    } else {}
    prefs.setString("carts", encodeCart());
  }

  @action
  decrementQty(int pId, int qtyDe) {
    int cartIndex = carts.indexWhere((element) {
      return pId == element.pId;
    });
    if (cartIndex > -1 && carts[cartIndex].quantity > 1) {
      carts[cartIndex].quantity -= qtyDe;
    } else {}
    prefs.setString("carts", encodeCart());
  }

  @action
  removeCart(int pId) {
    int cartIndex = carts.indexWhere((element) {
      return pId == element.pId;
    });
    carts.removeAt(cartIndex);
    prefs.setString("carts", encodeCart());
  }
}
