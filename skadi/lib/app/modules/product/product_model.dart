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
      image: json['image'],
      price: json['price'],
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'title': title,
        'image': image,
        'price': price,
      };
}
