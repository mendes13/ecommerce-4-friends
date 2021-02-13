import 'package:mockito/mockito.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/shopping_cart/repositories/interfaces/shopping_cart_repository_interface.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';

class MockShoppingCartRepository extends Mock
    implements IShoppingCartRepository {
  final ProductModel tProduct = ProductModel(
    id: 1,
    title: 'Test',
    image:
        'https://apartamento21.com.br/wp-content/uploads/2016/05/placeholder.png',
    price: 1000,
  );

  List<ShoppingCartItemModel> fillData() => [ShoppingCartItemModel(tProduct)];
  List<ShoppingCartItemModel> emptyData() => [];
}
