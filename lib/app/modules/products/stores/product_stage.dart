import 'package:universe_store/app/models/product.dart';

abstract class ProductState {
  List<Product> products;
  List<Categories> categories;
  ProductState({required this.products, required this.categories});
}

class ProductInitState extends ProductState {
  ProductInitState() : super(categories: [], products: []);
}

class ProductDataState extends ProductState {
  ProductDataState(
      {required List<Product> productList,
      required List<Categories> categoryList})
      : super(categories: categoryList, products: productList);
}
