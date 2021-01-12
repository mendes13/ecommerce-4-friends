import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'package:skadi/app/modules/shopping_cart/repositories/interfaces/shopping_cart_repository_interface.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';

part 'shopping_cart_controller.g.dart';

@Injectable()
class ShoppingCartController = _ShoppingCartControllerBase
    with _$ShoppingCartController;

abstract class _ShoppingCartControllerBase with Store {
  final IShoppingCartRepository repository;

  _ShoppingCartControllerBase(this.repository);

  @observable
  ObservableList<ShoppingCartItemModel> items =
      <ShoppingCartItemModel>[].asObservable();

  @action
  Future<void> add(ProductModel product, {int quantity = 1}) async {
    final ShoppingCartItemModel productInCart = items.singleWhere(
        (element) => element.product.id == product.id,
        orElse: () => null);

    if (productInCart != null) {
      final int index = items.indexOf(productInCart);

      final int newQuantity = productInCart.quantity + quantity;

      items.removeAt(index);

      final ShoppingCartItemModel item =
          ShoppingCartItemModel(product, quantity: newQuantity);

      items.add(item);
    } else {
      final ShoppingCartItemModel item =
          ShoppingCartItemModel(product, quantity: quantity);

      items.add(item);
    }

    //await save();
  }

  @action
  Future<void> removeItem(ProductModel product) async {
    items.removeWhere((element) => element.product.id == product.id);

    //await save();
  }

  @action
  Future<void> fetch() async {
    final itemsFromStorage = await repository.fetch();
    itemsFromStorage.forEach(items.add);
  }

  @computed
  int get getTotalQuantity => items.fold(
      0, (previousValue, element) => previousValue + element.quantity);

  @computed
  int get getTotalValue {
    int totalValue = 0;

    items.forEach((item) {
      totalValue += (item.product.price * item.quantity);
    });

    return totalValue;
  }

  Future<void> save() async => await repository.save(ShoppingCartModel(items));
}
