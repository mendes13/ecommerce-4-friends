import 'package:mockito/mockito.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/product/repositories/interfaces/product_repository_interface.dart';

class MockProductRepository extends Mock implements IProductRepository {
  final ProductModel tProduct = ProductModel(
    id: 1,
    title: "Test",
    price: 1000,
    image:
        'https://limonada.oficinareserva.com/wp-content/uploads/2016/05/placeholder.png',
  );

  List<ProductModel> fillData() => <ProductModel>[tProduct];
  List<ProductModel> emptyData() => <ProductModel>[];
}
