import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'order_controller.dart';

class OrderPage extends StatefulWidget {
  final String title;
  const OrderPage({Key key, this.title = "Order"}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends ModularState<OrderPage, OrderController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
