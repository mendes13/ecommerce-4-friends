import 'package:skadi/app/modules/product/product_model.dart';

class ShoppingCartModel {
  final List<ShoppingCartItemModel> items;

  ShoppingCartModel(this.items);
}

class ShoppingCartItemModel {
  final ProductModel product;
  final int quantity;

  ShoppingCartItemModel(this.product, {this.quantity = 1});
}