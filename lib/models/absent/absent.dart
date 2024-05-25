import 'package:atma_kitchen/models/absent/employee.dart';

class Absent {
  int? id;
  DateTime? date;
  Employee? employee;

  Absent({this.id, this.date, this.employee});

  factory Absent.fromJson(Map<String, dynamic> json) {
    return Absent(
      id: json['id_presensi_karyawan'],
      date: DateTime.parse(json['tanggal_absen']),
      employee: Employee.fromJson(json['karyawan']),
    );
  }
}
