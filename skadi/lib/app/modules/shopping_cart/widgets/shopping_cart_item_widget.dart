import 'package:flutter/material.dart';

class ShoppingCartItemWidget extends StatelessWidget {
  const ShoppingCartItemWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Text('Test'),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.keyboard_arrow_left_outlined),
                onPressed: () {},
              ),
              Text('1'),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_right_outlined),
                onPressed: () {},
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
