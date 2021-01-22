import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:skadi/app/modules/shopping_cart/repositories/interfaces/shopping_cart_repository_interface.dart';
import 'package:skadi/app/modules/shopping_cart/repositories/shopping_cart_repository.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';

import '../../shared/fakes/mock_local_storage.dart';

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
          .thenAnswer((_) async => localStorage.fillData());

      final List<ShoppingCartItemModel> actual = await repository.fetch();

      expect(actual, isInstanceOf<List<ShoppingCartItemModel>>());
      expect(actual.length, greaterThanOrEqualTo(1));
    });

    test("fetch test empty items", () async {
      when(localStorage.fetch())
          .thenAnswer((_) async => localStorage.emptyData());

      final List<ShoppingCartItemModel> actual = await repository.fetch();

      expect(actual, isInstanceOf<List<ShoppingCartItemModel>>());
      expect(actual.length, equals(0));
    });
  });
}
