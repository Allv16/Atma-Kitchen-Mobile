class Customer {
  int? id;
  String? name;
  String? birthDate;
  String? gender;
  int? points;
  String? phone;

  Customer(
      {this.id,
      this.name,
      this.birthDate,
      this.gender,
      this.points,
      this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id_customer'];
    name = json['nama_customer'];
    birthDate = json['tanggal_lahir'];
    gender = json['jenis_kelamin'];
    points = json['poin'];
    phone = json['no_telp'];
  }
}
