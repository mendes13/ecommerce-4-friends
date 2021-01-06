import 'package:intl/intl.dart';
import 'package:skadi/app/modules/shared/constants.dart';

class ProductModel {
  final int id;
  final String title;
  final String image;
  final int price;

  ProductModel({this.id, this.title, this.image, this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      image: '$BASE_URL${json['image']}',
      price: json['price'],
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'title': title,
        'image': image,
        'price': price,
      };

  String formattedPrice() {
    final NumberFormat numberFormat = NumberFormat('00.00');
    final String formattedPrice = numberFormat.format(price / 100).toString();
    return 'R\$ $formattedPrice';
  }
}
