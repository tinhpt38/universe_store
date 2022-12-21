import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:universe_store/app/models/cart.dart';
import 'package:universe_store/app/modules/cart/cart_store.dart';
import 'package:universe_store/app/modules/global_store.dart';
import 'package:universe_store/app/values/colors.dart';

import '../../components/cart_item.dart';
import '../../components/cart_total_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _store = CartStore();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _store.gets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'Cart',
          style: TextStyle(color: AppColors.primaryText),
        ),
      ),
      body: ScopedBuilder<CartStore, Exception, List<Cart>>(
        store: _store,
        onState: (context, state) {
          return Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: AppColors.primaryButton, width: 1)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartTotalItem(
                          leftLable: "Subtotal:",
                          rightLable: "${_store.calculateSubTotal()}",
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartTotalItem(
                          leftLable: "Total:",
                          rightLable: "${_store.calculateTotal()}",
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: AppColors.highLight,
                        ))),
                        child: CartItem(
                          cart: state[index],
                          removeCart: _store.removeCart,
                          incrementQty: _store.incrementQty,
                          decrementQty: _store.decrementQty,
                        ),
                      ),
                    );
                  },
                )),
              ],
            ),
          );
        },
        onError: (context, error) => Center(
            child: Dialog(
          child: Text(error.toString()),
        )),
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
