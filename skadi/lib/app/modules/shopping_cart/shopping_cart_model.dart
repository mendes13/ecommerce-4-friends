import 'package:skadi/app/modules/product/product_model.dart';

class ShoppingCartModel {
  final Map<int, ShoppingCartItemModel> items;

  ShoppingCartModel(this.items);
}

class ShoppingCartItemModel {
  final ProductModel product;
  int quantity;

  ShoppingCartItemModel(this.product, {this.quantity = 1});
}
