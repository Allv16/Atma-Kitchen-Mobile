class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  int? productionLimit;
  String? productType;
  String? urlToImage;
  int? partnerId;
  int? stock;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.productionLimit,
      this.productType,
      this.urlToImage,
      this.partnerId,
      this.stock});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id_produk'];
    name = json['nama_produk'];
    description = json['deskripsi'];
    price = (json['harga'] as num).toDouble();
    productionLimit = json['limit_produksi'];
    productType = json['jenis_produk'];
    urlToImage = json['foto'];
    partnerId = json['id_penitip'];
    stock = json['stok'];
  }
}
