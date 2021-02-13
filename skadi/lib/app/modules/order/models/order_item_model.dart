import 'package:skadi/app/modules/product/product_model.dart';

class OrderItemModel {
  final String title;
  final int price;
  final String image;
  final ProductModel product;
  final int quantity;

  OrderItemModel(
    this.title,
    this.price,
    this.image,
    this.product,
    this.quantity,
  );

  OrderItemModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        price = json['price'],
        image = json['image'],
        product = ProductModel.fromJson(json['product']),
        quantity = json['quantity'];

  Map<String, dynamic> get toJson => {
        'title': title,
        'price': price,
        'image': image,
        'product': product.toJson,
        'quantity': quantity,
      };
}
