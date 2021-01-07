import 'package:skadi/app/modules/shared/local_storage/local_storage_interface.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';

class LocalStorage implements ILocalStorage {
  @override
  Future<List<ShoppingCartItemModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> save(ShoppingCartModel shoppingCart) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
