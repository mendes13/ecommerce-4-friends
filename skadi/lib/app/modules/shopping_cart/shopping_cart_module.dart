import 'package:flutter_modular/flutter_modular.dart';

import 'shopping_cart_page.dart';

class ShoppingCartModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => ShoppingCartPage(),
        ),
      ];

  static Inject get to => Inject<ShoppingCartModule>.of();
}
