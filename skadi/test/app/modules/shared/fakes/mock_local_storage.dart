import 'package:mockito/mockito.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/shared/local_storage/local_storage_interface.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';

class MockLocalStorage extends Mock implements ILocalStorage {
  List<ShoppingCartItemModel> emptyData() => <ShoppingCartItemModel>[];

  List<ShoppingCartItemModel> fillData() => [
        ShoppingCartItemModel(
          ProductModel(
            id: 1,
            title: 'Test',
            price: 1000,
            image:
                'https://apartamento21.com.br/wp-content/uploads/2016/05/placeholder.png',
          ),
        ),
      ];
}
