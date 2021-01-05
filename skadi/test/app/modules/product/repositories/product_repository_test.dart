import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:skadi/app/modules/product/product_model.dart';

import 'package:skadi/app/modules/product/repositories/interfaces/product_repository_interface.dart';
import 'package:skadi/app/modules/product/repositories/product_repository.dart';
import 'package:skadi/app/modules/shared/custom_dio.dart';

class MockClient extends Mock implements CustomDio {}

void main() {
  IProductRepository repository;
  MockClient client;

  ProductModel tProductModel = ProductModel(
    id: 1,
    image: "image.jpg",
    title: "Test Product",
    price: 1000,
  );

  setUp(() {
    client = MockClient();
    repository = ProductRepository(client);
  });

  group('ProductRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<ProductRepository>());
    });

    test('returns the Products if the http call completes successfully',
        () async {
      when(client.get('/products')).thenAnswer(
        (_) async => Response(
          data: {
            'data': [tProductModel.toJson]
          },
          statusCode: 200,
        ),
      );
      final List<ProductModel> actual = await repository.fetchProducts();

      expect(actual, isInstanceOf<List<ProductModel>>());
      expect(actual.length, greaterThanOrEqualTo(1));
    });

    test('returns empty data if the http call completes with failure',
        () async {
      when(client.get('/products')).thenAnswer(
          (_) async => Response(data: {"data": []}, statusCode: 200));
      final List<ProductModel> actual = await repository.fetchProducts();

      expect(actual, isInstanceOf<List<ProductModel>>());
      expect(actual.length, greaterThanOrEqualTo(0));
    });
  });
}
