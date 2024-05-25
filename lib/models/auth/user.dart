import 'package:atma_kitchen/models/auth/customer.dart';

class User {
  int? id;
  String? username;
  String? email;
  DateTime? verifiedAt;
  String? urlToProfilePicture;
  int? roleId;
  Customer? customer;

  User(
      {this.id,
      this.username,
      this.email,
      this.verifiedAt,
      this.urlToProfilePicture,
      this.roleId,
      this.customer});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id_user'];
    username = json['username'];
    email = json['email'];
    verifiedAt = json['tanggal_diverifikasi'] != null
        ? DateTime.parse(json['tanggal_diverifikasi'])
        : null;
    urlToProfilePicture = json['url_foto'];
    roleId = json['id_role'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': id,
      'username': username,
      'email': email,
      'tanggal_diverifikasi': verifiedAt?.toIso8601String(),
      'url_foto': urlToProfilePicture,
      'id_role': roleId,
    };
  }
}
