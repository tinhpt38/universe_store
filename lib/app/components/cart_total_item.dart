import 'package:flutter/material.dart';

class CartTotalItem extends StatelessWidget {
  const CartTotalItem(
      {super.key, required this.leftLable, required this.rightLable});
  final String leftLable;
  final String rightLable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            leftLable,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            rightLable,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
