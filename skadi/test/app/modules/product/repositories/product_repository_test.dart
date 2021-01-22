import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/product/repositories/interfaces/product_repository_interface.dart';
import 'package:skadi/app/modules/product/repositories/product_repository.dart';

import '../../shared/fakes/mock_custom_dio.dart';
import '../fakes/mock_product_repository.dart';

void main() {
  ProductRepository repository;
  MockProductRepository mockProductRepository;
  MockCustomDio client;

  setUp(() {
    client = MockCustomDio();
    mockProductRepository = MockProductRepository();
    repository = ProductRepository(client);
  });

  group('ProductRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<IProductRepository>());
    });

    test('returns the Products if the http call completes successfully',
        () async {
      when(client.get('/products')).thenAnswer(
        (_) async => Response(
          data: {
            'data': [mockProductRepository.tProduct.toJson]
          },
          statusCode: 200,
        ),
      );
      final List<ProductModel> actual = await repository.fetch();

      expect(actual, isInstanceOf<List<ProductModel>>());
      expect(actual.length, greaterThanOrEqualTo(1));
    });

    test('returns empty data if the http call completes with failure',
        () async {
      when(client.get('/products')).thenAnswer(
          (_) async => Response(data: {"data": []}, statusCode: 200));
      final List<ProductModel> actual = await repository.fetch();

      expect(actual, isInstanceOf<List<ProductModel>>());
      expect(actual.length, greaterThanOrEqualTo(0));
    });
  });
}
