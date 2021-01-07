import 'package:skadi/app/modules/shared/local_storage/local_storage.dart';
import 'package:skadi/app/modules/shared/local_storage/local_storage_interface.dart';
import 'package:skadi/app/modules/shopping_cart/repositories/interfaces/shopping_cart_repository_interface.dart';

import 'repositories/shopping_cart_repository.dart';
import 'shopping_cart_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shopping_cart_page.dart';

class ShoppingCartModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LocalStorage()),
        Bind((i) => ShoppingCartRepository(i.get<ILocalStorage>())),
        Bind((i) => ShoppingCartController(i.get<IShoppingCartRepository>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ShoppingCartPage()),
      ];

  static Inject get to => Inject<ShoppingCartModule>.of();
}
