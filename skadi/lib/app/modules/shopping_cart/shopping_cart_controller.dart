import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'shopping_cart_controller.g.dart';

@Injectable()
class ShoppingCartController = _ShoppingCartControllerBase
    with _$ShoppingCartController;

abstract class _ShoppingCartControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
