import 'package:atma_kitchen/models/ingredients/ingredients.dart';

class IngredientsUsage {
  int? id;
  int? ingredientsId;
  int? usage;
  DateTime? date;
  String? unit;
  Ingredient? ingredient;

  IngredientsUsage(
      {this.id,
      this.ingredientsId,
      this.usage,
      this.unit,
      this.date,
      this.ingredient});

  IngredientsUsage.fromJson(Map<String, dynamic> json) {
    id = json['id_penggunaan_bahan_baku'];
    usage = json['jumlah_penggunaan'];
    unit = json['bahan_baku.satuan'];
    date = json['tanggal_penggunaan'] != null
        ? DateTime.parse(json['tanggal_penggunaan'])
        : null;
    ingredient = Ingredient.fromJson(json['bahan_baku']);
  }
}
