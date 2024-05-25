class Payment {
  int? id;
  String? paymentMethod;
  String? urlToPaymentProof;
  DateTime? paidAt;
  DateTime? verifiedAt;
  double? total;
  double? tips;

  Payment(
      {this.id,
      this.paymentMethod,
      this.urlToPaymentProof,
      this.paidAt,
      this.verifiedAt,
      this.total,
      this.tips});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id_pembayaran'];
    paymentMethod = json['jenis_pembayaran'];
    urlToPaymentProof = json['bukti_pembayaran'];
    paidAt = json['tanggal_pembayaran'] != null
        ? DateTime.parse(json['tanggal_pembayaran'])
        : null;
    verifiedAt = json['tanggal_pembayaran_valid'] != null
        ? DateTime.parse(json['tanggal_pembayaran_valid'])
        : null;
    total = (json['total_pembayaran'] as num).toDouble();
    tips = (json['tip'] as num).toDouble();
  }
}
