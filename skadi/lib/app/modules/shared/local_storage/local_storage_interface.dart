import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';

abstract class ILocalStorage {
  Future<List<ShoppingCartItemModel>> fetch();
  Future<void> save(ShoppingCartModel shoppingCart);
}
