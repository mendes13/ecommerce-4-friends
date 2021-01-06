import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:skadi/app/modules/product/product_model.dart';
import 'product_controller.dart';

class ProductPage extends StatefulWidget {
  final String title;
  const ProductPage({Key key, this.title = "Product"}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends ModularState<ProductPage, ProductController> {
  @override
  void initState() {
    controller.fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext _) {
          final List<ProductModel> products = controller.products;

          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (products.isEmpty) {
            return Center(child: Text('Sem produtos!'));
          }

          return ListView.builder(
            padding: EdgeInsets.all(8.0),
            physics: BouncingScrollPhysics(),
            itemCount: controller.products.length,
            itemBuilder: (BuildContext _, int index) {
              final ProductModel product = controller.products[index];
              return Container(
                child: Card(
                  child: InkWell(
                    onTap: () {
                      // todo navigate to details?
                    },
                    child: Column(
                      children: <Widget>[
                        Image.network(product.image),
                        SizedBox(height: 20.0),
                        Text(product.title),
                        SizedBox(height: 20.0),
                        Text(product.formattedPrice()),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
