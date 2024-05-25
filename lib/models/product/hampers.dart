import 'package:atma_kitchen/models/product/product.dart';

class Hampers {
  Product? hampers;
  List<Product>? items;

  Hampers({this.hampers, this.items});

  Hampers.fromJson(Map<String, dynamic> json) {
    hampers =
        json['hampers'] != null ? Product.fromJson(json['hampers']) : null;
    if (json['items'] != null) {
      items = <Product>[];
      json['items'].forEach((v) {
        items!.add(Product.fromJson(v));
      });
    }
  }
}
