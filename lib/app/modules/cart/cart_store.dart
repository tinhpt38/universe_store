import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:http/http.dart';
import 'package:universe_store/app/models/cart.dart';
import 'package:universe_store/app/modules/global_store.dart';

class CartStore extends NotifierStore<Exception, List<Cart>> {
  CartStore() : super([]);

  final GlobalStore _globalStore = Modular.get<GlobalStore>();
  Future gets() async {
    setLoading(true);
    update(_globalStore.carts);
    setLoading(false);
    // return {};
  }

  removeCart(int pid) {
    setLoading(true);
    _globalStore.removeCart(pid);
    update(_globalStore.carts);
    setLoading(false);
    // return {};
  }

  incrementQty(int pid) {
    _globalStore.incrementQty(pid, 1);
    update(_globalStore.carts);
    return {};
  }

  decrementQty(int pid) {
    _globalStore.decrementQty(pid, 1);
    update(_globalStore.carts);
    // return {};
  }

  calculateSubTotal() {
    double subTotal = 0;
    for (var i = 0; i < _globalStore.carts.length; i++) {
      Cart cart = _globalStore.carts[i];
      subTotal += cart.quantity * cart.product.price!;
    }
    return subTotal;
  }

  calculateTotal() {
    double subTotal = 0;
    for (var i = 0; i < _globalStore.carts.length; i++) {
      Cart cart = _globalStore.carts[i];
      subTotal += cart.quantity * cart.product.price!;
    }
    return subTotal;
  }
}
