import 'package:flutter_triple/flutter_triple.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:universe_store/app/models/error.dart';
import 'package:universe_store/app/models/product.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:universe_store/app/modules/global_store.dart';
import 'package:universe_store/app/modules/home/home_state.dart';
import 'package:universe_store/app/modules/products/stores/product_stage.dart';
import 'package:universe_store/app/service/woocomerce/woo_service.dart';

// part 'product_store.g.dart';
class HomeStote extends StreamStore<Failure, HomeState> {
  HomeStote() : super(HomeInitState());

  final WooService _wooService = WooService();
  final GlobalStore _globalStore = Modular.get<GlobalStore>();

  Future gets() async {
    setLoading(true);
    List<Product> products = await _wooService.retrieveProducts();
    List<Categories> categories = await _wooService.retrieveProductCategories();
    _globalStore.products = ObservableList<Product>.of(products);
    update(HomeDataState(productList: products, categoryList: categories));
    setLoading(false);
    return {};
  }

  fillterByCategory(id){
    
  }
}
