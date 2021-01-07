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
    items.add(ShoppingCartItemModel(product, quantity: quantity));
    await save();
  }

  @action
  Future<void> fetch() async {
    final itemsFromStorage = await repository.fetch();
    itemsFromStorage.forEach(items.add);
  }

  Future<void> save() async => await repository.save(ShoppingCartModel(items));
}
