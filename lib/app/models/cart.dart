import 'package:universe_store/app/models/product.dart';

class Cart {
  late int pId;
  late DateTime createdAt;
  late int quantity;
  late int customerId;
  late Product product;

  Cart(
      {required this.pId,
      required this.createdAt,
      required this.quantity,
      required this.customerId,
      required this.product});
}
