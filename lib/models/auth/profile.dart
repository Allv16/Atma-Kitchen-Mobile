import 'package:atma_kitchen/models/auth/user.dart';

class Profile {
  int? id;
  String? fullname;
  DateTime? birthDate;
  String? gender;
  int? points;
  String? phone;
  User? user;

  Profile(
      {this.id,
      this.fullname,
      this.birthDate,
      this.gender,
      this.points,
      this.phone,
      this.user});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id_customer'];
    fullname = json['nama_customer'];
    birthDate = json['tanggal_lahir'] != null
        ? DateTime.parse(json['tanggal_lahir'])
        : null;
    gender = json['jenis_kelamin'];
    points = json['poin'];
    phone = json['no_telp'];
    user = User.fromJson(json['user']);
  }
}
