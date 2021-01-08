import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/shopping_cart/repositories/interfaces/shopping_cart_repository_interface.dart';

import 'package:skadi/app/modules/shopping_cart/shopping_cart_controller.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';

class MockShoppingCartRepository extends Mock
    implements IShoppingCartRepository {
  final ProductModel tProduct = ProductModel(
    id: 1,
    title: 'Test',
    image:
        'https://apartamento21.com.br/wp-content/uploads/2016/05/placeholder.png',
    price: 1000,
  );

  List<ShoppingCartItemModel> fillItems() {
    return [ShoppingCartItemModel(tProduct)];
  }
}

void main() {
  ShoppingCartController controller;
  final repository = MockShoppingCartRepository();

  setUp(() {
    controller = ShoppingCartController(repository);
  });

  group('ShoppingCartController Test', () {
    test("First Test", () {
      expect(controller, isInstanceOf<ShoppingCartController>());
    });

    test("fetch fill items", () async {
      expect(controller.items.length, equals(0));

      when(repository.fetch()).thenAnswer((_) async => repository.fillItems());

      await controller.fetch();

      expect(controller.items.length, greaterThanOrEqualTo(1));
    });

    test('add items in shopping cart', () async {
      expect(controller.items.length, equals(0));

      await controller.add(repository.tProduct, 0);

      expect(controller.items.length, greaterThanOrEqualTo(1));
      expect(controller.items.first.quantity, equals(1));
    });

    test('check if quantity sum of item in cart', () async {
      expect(controller.items.length, equals(0));

      final tProduct = repository.tProduct;

      await controller.add(tProduct, 0);

      expect(controller.items.length, equals(1));

      await controller.add(tProduct, 0, quantity: 1);

      expect(controller.items.length, equals(1));
      expect(controller.items.first.quantity, 2);
    });
  });
}
