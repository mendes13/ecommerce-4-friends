import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:skadi/app/modules/product/product_controller.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/product/repositories/interfaces/product_repository_interface.dart';
import 'package:skadi/app/modules/shopping_cart/repositories/interfaces/shopping_cart_repository_interface.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_controller.dart';

class MockProductRepository extends Mock implements IProductRepository {
  final ProductModel tProduct = ProductModel();

  List<ProductModel> mockProducts() => <ProductModel>[tProduct];
  List<ProductModel> mockEmptyProducts() => <ProductModel>[];
}

class MockShoppingCartRepository extends Mock
    implements IShoppingCartRepository {}

void main() async {
  ProductController controller;
  MockProductRepository repository;
  MockShoppingCartRepository shoppingCartRepository;

  setUp(() {
    repository = MockProductRepository();
    shoppingCartRepository = MockShoppingCartRepository();
    final ShoppingCartController shoppingCartController =
        ShoppingCartController(shoppingCartRepository);

    controller = ProductController(repository, shoppingCartController);
  });

  group('ProductController Test', () {
    test("Check is instance of", () {
      expect(controller, isInstanceOf<ProductController>());
    });

    test("Get Products", () async {
      expect(controller.products.length, equals(0));

      when(repository.fetch())
          .thenAnswer((_) async => repository.mockProducts());
      await controller.fetchProducts();

      expect(controller.products.length, greaterThanOrEqualTo(1));
    });

    test("Get Empty Products", () async {
      expect(controller.products.length, equals(0));

      when(repository.fetch())
          .thenAnswer((_) async => repository.mockEmptyProducts());
      await controller.fetchProducts();

      expect(controller.products.length, equals(0));
    });

    test('add product in shoppingcart', () async {
      expect(controller.shoppingCartController.items.length, equals(0));

      final product = repository.tProduct;

      await controller.addShoppingCart(product);

      expect(controller.shoppingCartController.items.length,
          greaterThanOrEqualTo(1));
      expect(controller.shoppingCartController.items[product.id].quantity,
          equals(1));
    });
  });
}
