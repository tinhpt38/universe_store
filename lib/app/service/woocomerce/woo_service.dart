import 'package:universe_store/app/models/product.dart';
import 'package:universe_store/woo.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

class WooService {
  final WooCommerceAPI _api = WooCommerceAPI(
      url: Woo.baseUrl,
      consumerKey: Woo.consumerKey,
      consumerSecret: Woo.consumerSecret);
  // retrieveProducts

  Future<List<Product>> retrieveProducts() async {
    List<dynamic> rawProduct = await _api.getAsync("products");
    List<Product> products =
        rawProduct.map((e) => Product.fromJson(e)).toList();
    return products;
  }

    Future<List<Categories>> retrieveProductCategories() async {
    List<dynamic> records = await _api.getAsync("products/categories");
    List<Categories> categories =
        records.map((e) => Categories.fromJson(e)).toList();
    return categories;
  }
}
