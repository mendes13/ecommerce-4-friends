import 'package:flutter/material.dart';
import 'package:skadi/app/modules/shopping_cart/shopping_cart_model.dart';

class ShoppingCartItemWidget extends StatelessWidget {
  final ShoppingCartItemModel shoppingCartItem;
  final VoidCallback removeItem;
  final VoidCallback quantityIncrement;
  final VoidCallback quantityDecrease;

  const ShoppingCartItemWidget(
    this.shoppingCartItem, {
    this.removeItem,
    this.quantityIncrement,
    this.quantityDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(shoppingCartItem.product.title),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.keyboard_arrow_left_outlined),
                onPressed: quantityDecrease,
              ),
              Text(shoppingCartItem.quantity.toString()),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_right_outlined),
                onPressed: quantityIncrement,
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.red),
            onPressed: removeItem,
          ),
        ],
      ),
    );
  }
}
