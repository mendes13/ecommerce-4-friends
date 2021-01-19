import 'package:flutter_modular/flutter_modular.dart';

abstract class IOrderRepository implements Disposable {
  Future fetchPost();
}
