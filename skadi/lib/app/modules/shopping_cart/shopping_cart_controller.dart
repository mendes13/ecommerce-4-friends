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
  ObservableMap<int, ShoppingCartItemModel> items =
      <int, ShoppingCartItemModel>{}.asObservable();

  @action
  Future<void> add(ProductModel product, {int quantity = 1}) async {
    final item = items[product.id];

    final ShoppingCartItemModel newItem =
        ShoppingCartItemModel(product, quantity: quantity);

    if (item != null) {
      newItem.quantity = item.quantity + quantity;
    }

    items[product.id] = newItem;

    //await save();
  }

  @action
  Future<void> removeItem(ProductModel product) async {
    items.remove(product.id);

    //await save();
  }

  @action
  Future<void> removeQuantityFromProduct(ProductModel product,
      {quantity = 1}) async {
    final oldItem = items[product.id];

    final int newQuantity = oldItem.quantity - quantity;

    final newItem = ShoppingCartItemModel(product, quantity: newQuantity);

    items[product.id] = newItem;
  }

  @action
  Future<void> fetch() async {
    final itemsFromStorage = await repository.fetch();
    itemsFromStorage.forEach((item) => items[item.product.id] = item);
  }

  @computed
  int get getTotalQuantity => items.entries.fold(
      0, (previousValue, element) => previousValue + element.value.quantity);

  @computed
  int get getTotalValue {
    int totalValue = 0;

    items.entries.forEach((item) {
      final int price = item.value.product.price;
      final int quantity = item.value.quantity;

      totalValue += (price * quantity);
    });

    return totalValue;
  }

  Future<void> save() async => await repository.save(ShoppingCartModel(items));
}
