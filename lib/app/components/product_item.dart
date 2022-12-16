import 'package:flutter/material.dart';
import 'package:universe_store/app/models/product.dart';
import 'package:universe_store/app/values/colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, required this.onClick});
  final Product product;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image:
                    DecorationImage(image: NetworkImage(product.images[0].src))),
          ),
          Positioned(
            bottom: 32,
            left: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.foreground,
                borderRadius: BorderRadius.circular(90),
              ),
              child: Text(
                product.name,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primaryButton,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
