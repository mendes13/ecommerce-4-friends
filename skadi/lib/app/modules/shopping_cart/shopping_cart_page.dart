import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:skadi/app/modules/shopping_cart/widgets/shopping_cart_item_widget.dart';
import 'shopping_cart_controller.dart';

class ShoppingCartPage extends StatefulWidget {
  final String title;
  const ShoppingCartPage({Key key, this.title = "ShoppingCart"})
      : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final controller = Modular.get<ShoppingCartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .7,
            child: Observer(
              builder: (BuildContext _) {
                return ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (BuildContext _, int index) {
                    return ShoppingCartItemWidget(
                      controller.items[index],
                      removeItem: () {
                        controller.removeItem(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: OutlineButton(
              onPressed: () {},
              child: Text('Pay R\$ 200.00'),
            ),
          ),
        ],
      ),
    );
  }
}
