import 'package:skadi/app/modules/shared/local_storage/local_storage_interface.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';

import 'interfaces/shopping_cart_repository_interface.dart';

class ShoppingCartRepository implements IShoppingCartRepository {
  final ILocalStorage localStorage;

  ShoppingCartRepository(this.localStorage);

  @override
  Future<void> save(ShoppingCartModel shoppingCart) {
    // TODO: implement saveShoppingCartModel shoppingCart
    throw UnimplementedError();
  }

  @override
  Future<List<ShoppingCartItemModel>> fetch() async {
    return await localStorage.fetch();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
