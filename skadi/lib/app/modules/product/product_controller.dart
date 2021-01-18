import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/product/repositories/interfaces/product_repository_interface.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_controller.dart';

part 'product_controller.g.dart';

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  final IProductRepository repository;
  final ShoppingCartController shoppingCartController;

  _ProductControllerBase(this.repository, this.shoppingCartController);

  @observable
  List<ProductModel> products = <ProductModel>[];

  @observable
  bool isLoading;

  @observable
  String error;

  @action
  Future<void> fetchProducts() async {
    isLoading = true;
    try {
      products = await repository.fetch();
    } on DioError catch (dioError) {
      error = dioError.message;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> addShoppingCart(ProductModel product) async {
    await shoppingCartController.add(product);
  }
}
