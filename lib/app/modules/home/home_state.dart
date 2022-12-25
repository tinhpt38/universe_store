import 'package:universe_store/app/models/product.dart';

abstract class HomeState {
  List<Product> products;
  List<Categories> categories;
  HomeState({required this.products, required this.categories});
}

class HomeInitState extends HomeState {
  HomeInitState() : super(categories: [], products: []);
}

class HomeDataState extends HomeState {
  HomeDataState(
      {required List<Product> productList,
      required List<Categories> categoryList})
      : super(categories: categoryList, products: productList);
}
