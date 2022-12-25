import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:universe_store/app/components/product_item.dart';
import 'package:universe_store/app/models/product.dart';
import 'package:universe_store/app/modules/products/stores/product_stage.dart';
import 'package:universe_store/app/modules/products/stores/product_store.dart';
import 'package:universe_store/app/values/colors.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductStore _store = ProductStore();

  @override
  void initState() {
    super.initState();
    _store.gets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Explore',
          style: TextStyle(color: AppColors.primaryText),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              child: ScopedBuilder<ProductStore, Exception, ProductState>(
            store: _store,
            onState: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16),
                    itemCount: state.products.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return ProductItem(
                          product: state.products[index],
                          onClick: () {
                            Modular.to.pushNamed(
                              "/detail",
                              arguments: state.products[index],
                            );
                          });
                    }),
              );
            },
            onError: (context, error) => Center(child: Text(error.toString())),
            onLoading: (context) =>
                const Center(child: CircularProgressIndicator()),
          ))
        ],
      ),
    );
  }
}
