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
  Future<void> add(ProductModel product, int index, {int quantity = 1}) async {
    final bool indexExist = items.asMap().containsKey(index);

    final item = ShoppingCartItemModel(product, quantity: quantity);

    if (indexExist) {
      final int oldQuantity = items[index].quantity;
      items.removeAt(index);
      item.quantity += oldQuantity;
    }

    items.add(item);

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

  Future<void> save() async => await repository.save(ShoppingCartModel(items));
}
