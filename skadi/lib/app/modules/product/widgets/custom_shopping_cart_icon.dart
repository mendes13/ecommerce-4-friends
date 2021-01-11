import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_controller.dart';

class CustomShoppingCartIcon extends StatelessWidget {
  final ShoppingCartController controller;

  const CustomShoppingCartIcon(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          Positioned(
            right: 5.0,
            bottom: 10.0,
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Observer(
                  builder: (BuildContext _) {
                    return Text(
                      controller.getTotalQuantity.toString(),
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
