import 'package:dio/native_imp.dart';

import 'interfaces/order_repository_interface.dart';

class OrderRepository implements IOrderRepository {
  final DioForNative client;

  OrderRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
