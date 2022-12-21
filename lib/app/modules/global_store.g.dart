// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalStore on _GlobalStore, Store {
  late final _$cartsAtom = Atom(name: '_GlobalStore.carts', context: context);

  @override
  ObservableList<Cart> get carts {
    _$cartsAtom.reportRead();
    return super.carts;
  }

  @override
  set carts(ObservableList<Cart> value) {
    _$cartsAtom.reportWrite(value, super.carts, () {
      super.carts = value;
    });
  }

  late final _$productsAtom =
      Atom(name: '_GlobalStore.products', context: context);

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_GlobalStore.currentUser', context: context);

  @override
  WPUser? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(WPUser? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$currentCustomerAtom =
      Atom(name: '_GlobalStore.currentCustomer', context: context);

  @override
  Customer? get currentCustomer {
    _$currentCustomerAtom.reportRead();
    return super.currentCustomer;
  }

  @override
  set currentCustomer(Customer? value) {
    _$currentCustomerAtom.reportWrite(value, super.currentCustomer, () {
      super.currentCustomer = value;
    });
  }

  late final _$getsAsyncAction =
      AsyncAction('_GlobalStore.gets', context: context);

  @override
  Future gets() {
    return _$getsAsyncAction.run(() => super.gets());
  }

  late final _$_GlobalStoreActionController =
      ActionController(name: '_GlobalStore', context: context);

  @override
  dynamic addCart(int pid, Product product) {
    final _$actionInfo = _$_GlobalStoreActionController.startAction(
        name: '_GlobalStore.addCart');
    try {
      return super.addCart(pid, product);
    } finally {
      _$_GlobalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementQty(int pId, int qtyAdd) {
    final _$actionInfo = _$_GlobalStoreActionController.startAction(
        name: '_GlobalStore.incrementQty');
    try {
      return super.incrementQty(pId, qtyAdd);
    } finally {
      _$_GlobalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrementQty(int pId, int qtyDe) {
    final _$actionInfo = _$_GlobalStoreActionController.startAction(
        name: '_GlobalStore.decrementQty');
    try {
      return super.decrementQty(pId, qtyDe);
    } finally {
      _$_GlobalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeCart(int pId) {
    final _$actionInfo = _$_GlobalStoreActionController.startAction(
        name: '_GlobalStore.removeCart');
    try {
      return super.removeCart(pId);
    } finally {
      _$_GlobalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carts: ${carts},
products: ${products},
currentUser: ${currentUser},
currentCustomer: ${currentCustomer}
    ''';
  }
}
