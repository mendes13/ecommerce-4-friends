import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:skadi/app/modules/product/product_controller.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/product/repositories/interfaces/product_repository_interface.dart';

class MockProductRepository extends Mock implements IProductRepository {
  List<ProductModel> mockProducts() => <ProductModel>[ProductModel()];
  List<ProductModel> mockEmptyProducts() => <ProductModel>[];
}

void main() async {
  ProductController productController;
  final repository = MockProductRepository();

  setUp(() {
    productController = ProductController(repository);
  });

  group('ProductController Test', () {
    test("Check is instance of", () {
      expect(productController, isInstanceOf<ProductController>());
    });

    test("Get Products", () async {
      expect(productController.products.length, equals(0));

      when(repository.fetchProducts())
          .thenAnswer((_) async => repository.mockProducts());
      await productController.fetchProducts();

      expect(productController.products.length, greaterThanOrEqualTo(1));
    });

    test("Get Empty Products", () async {
      expect(productController.products.length, equals(0));

      when(repository.fetchProducts())
          .thenAnswer((_) async => repository.mockEmptyProducts());
      await productController.fetchProducts();

      expect(productController.products.length, equals(0));
    });
  });
}
