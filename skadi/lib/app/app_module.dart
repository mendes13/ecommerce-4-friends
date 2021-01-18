import 'package:skadi/app/modules/product/product_module.dart';
import 'package:skadi/app/modules/shared/custom_dio.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_controller.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:skadi/app/app_widget.dart';

import 'modules/shared/local_storage/local_storage.dart';
import 'modules/shared/local_storage/local_storage_interface.dart';
import 'modules/shopping_cart/repositories/interfaces/shopping_cart_repository_interface.dart';
import 'modules/shopping_cart/repositories/shopping_cart_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => CustomDio()),
        Bind((i) => LocalStorage()),
        Bind((i) => ShoppingCartRepository(i.get<ILocalStorage>())),
        Bind((i) => ShoppingCartController(i.get<IShoppingCartRepository>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/products', module: ProductModule()),
        ModularRouter('/shoppingcart', module: ShoppingCartModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
