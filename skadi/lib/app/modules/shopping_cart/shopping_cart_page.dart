import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:skadi/app/modules/product/product_model.dart';
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
                if (controller.items.isEmpty) {
                  return Center(
                    child: Text('Empty products!'),
                  );
                }

                return ListView(
                  children: controller.items.entries
                      .map(
                        (entry) => ShoppingCartItemWidget(
                          controller.items[entry.value.product.id],
                          quantityIncrement: () async {
                            await controller.add(entry.value.product);
                          },
                          quantityDecrease: () async {
                            await controller
                                .removeQuantityFromProduct(entry.value.product);
                          },
                          removeItem: () async {
                            await controller.removeItem(entry.value.product);
                          },
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: OutlineButton(
              onPressed: () {},
              child: Observer(
                builder: (BuildContext _) {
                  return Text('Pay ${controller.getTotalValue}');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
