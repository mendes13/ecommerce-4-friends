import 'package:skadi/app/modules/order/models/order_item_model.dart';

class OrderModel {
  final List<OrderItemModel> items;

  OrderModel(this.items);

  Map<String, dynamic> get toJson => {
        'data': items.map((item) => item.toJson),
      };
}
