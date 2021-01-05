import 'package:mobx/mobx.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/product/repositories/interfaces/product_repository_interface.dart';

part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  final IProductRepository productRepository;

  _ProductControllerBase(this.productRepository);

  @observable
  List<ProductModel> products = <ProductModel>[];

  @observable
  bool isLoading;

  @action
  Future<void> fetchProducts() async {
    isLoading = true;
    products = await productRepository.fetchProducts();
    isLoading = false;
  }
}
