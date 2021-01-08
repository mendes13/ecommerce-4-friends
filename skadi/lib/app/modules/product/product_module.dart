import 'package:skadi/app/modules/product/repositories/interfaces/product_repository_interface.dart';
import 'package:skadi/app/modules/product/repositories/product_repository.dart';
import 'package:skadi/app/modules/shared/custom_dio.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_controller.dart';

import 'product_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'product_page.dart';

class ProductModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProductRepository(i.get<CustomDio>())),
        Bind(
          (i) => ProductController(
            i.get<IProductRepository>(),
            i.get<ShoppingCartController>(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ProductPage()),
      ];

  static Inject get to => Inject<ProductModule>.of();
}
