import 'package:dio/dio.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/shared/custom_dio.dart';

import 'interfaces/product_repository_interface.dart';

class ProductRepository implements IProductRepository {
  final CustomDio client;

  ProductRepository(this.client);

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await client.get('/products');

      final List list = response.data['data'] ?? [];

      return list.map((json) => ProductModel.fromJson(json)).toList();
    } on DioError {
      return [];
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
