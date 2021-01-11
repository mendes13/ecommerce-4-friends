import 'package:flutter/material.dart';
import 'package:skadi/app/modules/product/product_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onPressed;

  const ProductWidget(this.product, {this.onPressed});

  @override
  Widget build(BuildContext context) {
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(product.title),
                          Text(product.formattedPrice()),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        child: Text('Add to cart'),
                        onPressed: onPressed,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
