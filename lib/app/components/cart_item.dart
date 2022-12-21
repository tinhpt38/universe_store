import 'package:flutter/material.dart';
import 'package:universe_store/app/values/colors.dart';
import '../models/cart.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.cart,
      required this.removeCart,
      required this.incrementQty,
      required this.decrementQty});
  final Cart cart;
  final Function(int) removeCart;
  final Function(int) incrementQty;
  final Function(int) decrementQty;

  double calSubtotal() => cart.product.price! * cart.quantity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(cart.product.images[0].src),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text(
                            cart.product.name.toUpperCase(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryButton),
                          )),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              removeCart(cart.pId);
                            },
                            alignment: Alignment.centerRight,
                            icon: Icon(
                              Icons.delete,
                              color: AppColors.superHighlight,
                            ),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(flex: 2, child: Text("QUANTITY")),
                      Expanded(
                          // ignore: sort_child_properties_last
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  color: Colors.grey))),
                                      child: InkWell(
                                        onTap: () {
                                          incrementQty(cart.pId);
                                        },
                                        child: const Text(
                                          "+",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  color: Colors.grey))),
                                      child: Text(
                                        '${cart.quantity}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        decrementQty(cart.pId);
                                      },
                                      child: const Text(
                                        "-",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          flex: 1)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        const Expanded(flex: 3, child: Text("SUBTOTAL")),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "${calSubtotal()}",
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
