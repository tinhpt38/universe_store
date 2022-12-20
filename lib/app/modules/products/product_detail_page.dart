import 'package:advance_notification/advance_notification.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:universe_store/app/models/cart.dart';
import 'package:universe_store/app/models/product.dart';
import 'package:universe_store/app/values/colors.dart';

import '../global_store.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Product _product;

  @override
  void initState() {
    _product = widget.product;
    super.initState();
  }

  int sumQuantity(List<Cart> lists) {
    int sum = 0;
    for (var element in lists) {
      sum += element.quantity;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // GlobalStore globalStore = Modular.get<GlobalStore>();
    // final globalStore = Provider.of<GlobalStore>(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: BackButton(
          color: AppColors.primaryButton,
          onPressed: (() => Navigator.pop(context)),
        ),
        actions: [
          // Observer(
          //   builder: (_) => Text(
          //     '${sumQuantity(globalStore.carts)}',
          //     style: TextStyle(color: Colors.red, fontSize: 16),
          //   ),
          // ),
        ],
        title: Text(
          _product.name,
          style: TextStyle(color: AppColors.primaryText),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 12),
                width: double.infinity,
                height: width * 2 / 3,
                child: Image.network(
                  _product.images[0].src,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Text(
                        _product.name.toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.grey,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 12, bottom: 12, right: 12),
                child: Text(
                  '\$${_product.price}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryButton),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 12, bottom: 12, right: 12),
                child: ExpandablePanel(
                    header: const Text(
                      'Materials',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    collapsed: const Divider(
                      height: 2,
                    ),
                    expanded: Html(
                      data: _product.description,
                    )
                    // tapHeaderToExpand: true,
                    // hasIcon: true,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 12, bottom: 12, right: 12),
                child: ExpandablePanel(
                    header: const Text(
                      'Demensions',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    collapsed: const Divider(
                      height: 2,
                    ),
                    expanded: Html(
                      data: '',
                    )
                    // tapHeaderToExpand: true,
                    // hasIcon: true,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 12, bottom: 12, right: 12),
                child: ExpandablePanel(
                    header: const Text(
                      'Shipping & Delivery',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    collapsed: const Divider(
                      height: 2,
                    ),
                    expanded: Html(
                      data: '',
                    )
                    // tapHeaderToExpand: true,
                    // hasIcon: true,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          GlobalStore globalStore = Modular.get<GlobalStore>();
                          globalStore.addCart(_product.id);
                          AdvanceSnackBar(
                                  message: "Product added successfully",
                                  bgColor: Colors.blueAccent)
                              .show(context);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              side: BorderSide(
                                  color: AppColors.primaryButton, width: 2),
                              borderRadius: BorderRadius.circular(90.0),
                            ))),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                              color: AppColors.primaryButton,
                              fontSize: 18,
                            ),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.primaryButton),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              side: BorderSide(
                                  color: AppColors.primaryButton, width: 2),
                              borderRadius: BorderRadius.circular(90.0),
                            ))),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Buy now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 72,
              )
            ],
          ),
        ),
      ),
    );
  }
}
