class Employee {
  int? id;
  String? name;
  double? salary;
  double? bonus;

  Employee({this.id, this.name, this.salary, this.bonus});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id_karyawan'],
      name: json['nama_karyawan'],
      salary: (json['gaji_karyawan'] as num).toDouble(),
      bonus: (json['bonus_gaji_karyawan'] as num).toDouble(),
    );
  }
}
