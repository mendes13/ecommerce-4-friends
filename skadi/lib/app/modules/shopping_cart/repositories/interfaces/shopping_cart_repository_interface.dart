import 'package:flutter_modular/flutter_modular.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';

abstract class IShoppingCartRepository implements Disposable {
  Future<List<ShoppingCartItemModel>> fetch();
  Future<void> save(ShoppingCartModel shoppingCart);
}
