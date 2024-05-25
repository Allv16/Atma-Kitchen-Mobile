import 'package:atma_kitchen/models/product/product.dart';

class TransactionDetails {
  int? id;
  int? quantity;
  double? price;
  Product? product;

  TransactionDetails({this.id, this.quantity, this.price, this.product});

  TransactionDetails.fromJson(Map<String, dynamic> json) {
    id = json['id_detail_transaksi'];
    quantity = json['jumlah_item'];
    price = (json['harga_satuan'] as num).toDouble();
    product = Product.fromJson(json['produk']);
  }
}
