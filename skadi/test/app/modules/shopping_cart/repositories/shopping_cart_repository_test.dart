import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/shared/local_storage/local_storage_interface.dart';

import 'package:skadi/app/modules/shopping_cart/repositories/interfaces/shopping_cart_repository_interface.dart';
import 'package:skadi/app/modules/shopping_cart/repositories/shopping_cart_repository.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';

class MockLocalStorage extends Mock implements ILocalStorage {
  List<ShoppingCartItemModel> emptyItems() {
    return <ShoppingCartItemModel>[];
  }

  List<ShoppingCartItemModel> fillItems() {
    final ProductModel product = ProductModel(
      id: 1,
      title: 'Test',
      price: 1000,
      image:
          'https://apartamento21.com.br/wp-content/uploads/2016/05/placeholder.png',
    );

    return [
      ShoppingCartItemModel(product),
    ];
  }
}

void main() {
  IShoppingCartRepository repository;
  MockLocalStorage localStorage;

  setUp(() {
    localStorage = MockLocalStorage();
    repository = ShoppingCartRepository(localStorage);
  });

  group('ShoppingCartRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<ShoppingCartRepository>());
    });

    test("fetch test fill items", () async {
      when(localStorage.fetch())
          .thenAnswer((_) async => localStorage.fillItems());

      final List<ShoppingCartItemModel> actual = await repository.fetch();

      expect(actual, isInstanceOf<List<ShoppingCartItemModel>>());
      expect(actual.length, greaterThanOrEqualTo(1));
    });

    test("fetch test empty items", () async {
      when(localStorage.fetch())
          .thenAnswer((_) async => localStorage.emptyItems());

      final List<ShoppingCartItemModel> actual = await repository.fetch();

      expect(actual, isInstanceOf<List<ShoppingCartItemModel>>());
      expect(actual.length, equals(0));
    });
  });
}
