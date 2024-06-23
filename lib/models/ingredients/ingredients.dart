class Ingredient {
  int? id;
  String? name;
  String? unit;
  int? stock;
  int? minimumStock;

  Ingredient({this.id, this.name, this.unit, this.stock, this.minimumStock});

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json['id_bahan_baku'];
    name = json['nama_bahan_baku'];
    unit = json['satuan'];
    stock = json['stok'];
    minimumStock = json['min_stok'];
  }
}
