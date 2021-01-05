import 'package:flutter_modular/flutter_modular.dart';
import 'package:skadi/app/modules/product/product_model.dart';

abstract class IProductRepository implements Disposable {
  Future<List<ProductModel>> fetchProducts();
}
