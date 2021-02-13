import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:skadi/app/modules/shopping_cart/shopping_cart_controller.dart';

import 'fakes/mock_shopping_cart_repository.dart';

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

      when(repository.fetch()).thenAnswer((_) async => repository.fillData());

      await controller.fetch();

      expect(controller.items.length, greaterThanOrEqualTo(1));
    });

    test('add items in shopping cart', () async {
      expect(controller.items.length, equals(0));

      final tProduct = repository.tProduct;
      await controller.add(tProduct);

      expect(controller.items.length, greaterThanOrEqualTo(1));
      expect(controller.items[tProduct.id].quantity, equals(1));
    });

    test('check if quantity sum of item in cart', () async {
      expect(controller.items.length, equals(0));

      final tProduct = repository.tProduct;

      await controller.add(tProduct);

      expect(controller.items.length, equals(1));

      await controller.add(tProduct, quantity: 1);

      expect(controller.items.length, equals(1));
      expect(controller.items[tProduct.id].quantity, 2);
    });

    test('remove item', () async {
      final product = repository.tProduct;

      await controller.add(product);
      await controller.removeItem(product);

      expect(controller.items.length, equals(0));
    });

    test('remove quantity from item', () async {
      final tProduct = repository.tProduct;

      await controller.add(tProduct, quantity: 2);
      await controller.removeQuantityFromProduct(tProduct, quantity: 1);

      expect(controller.items[tProduct.id].quantity, equals(1));
    });
  });
}
