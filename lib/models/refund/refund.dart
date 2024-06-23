class Refund {
  int? id;
  DateTime? requestDate;
  DateTime? confirmDate;
  double? amount;
  String? accountNumber;
  String? status;

  Refund(
      {this.id,
      this.requestDate,
      this.confirmDate,
      this.amount,
      this.accountNumber,
      this.status});

  Refund.fromJson(Map<String, dynamic> json) {
    id = json['id_pengembalian_dana'];
    requestDate = json['tanggal_pengembalian_diajukan'] != null
        ? DateTime.parse(json['tanggal_pengembalian_diajukan'])
        : null;
    confirmDate = json['tanggal_pengembalian_diterima'] != null
        ? DateTime.parse(json['tanggal_pengembalian_diterima'])
        : null;
    amount = (json['jumlah_pengembalian'] as num).toDouble();
    accountNumber = json['nomor_rekening_tujuan'];
    status = json['status_pengembalian'];
  }
}
