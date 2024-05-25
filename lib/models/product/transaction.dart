import 'dart:core';

import 'package:atma_kitchen/models/product/payment.dart';
import 'package:atma_kitchen/models/product/transaction_details.dart';

class Transaction {
  String? id;
  DateTime? createdAt;
  DateTime? toBePickupAt;
  DateTime? acceptedAt;
  DateTime? processedAt;
  DateTime? readydAt;
  DateTime? pickupAt;
  DateTime? completedAt;
  DateTime? rejectedAt;
  int? pointsUsed;
  int? pointsEarned;
  double? total;
  String? deliveryMethod;
  String? status;
  Payment? payment;
  List<TransactionDetails>? transactionDetails;

  Transaction(
      {this.id,
      this.createdAt,
      this.toBePickupAt,
      this.acceptedAt,
      this.processedAt,
      this.readydAt,
      this.pickupAt,
      this.completedAt,
      this.pointsUsed,
      this.pointsEarned,
      this.total,
      this.deliveryMethod,
      this.status,
      this.payment,
      this.transactionDetails,
      this.rejectedAt});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id_transaksi'];
    createdAt = json['tanggal_nota_dibuat'] != null
        ? DateTime.parse(json['tanggal_nota_dibuat'])
        : null;
    toBePickupAt = json['tanggal_ambil'] != null
        ? DateTime.parse(json['tanggal_ambil'])
        : null;
    rejectedAt = json['tanggal_ditolak'] != null
        ? DateTime.parse(json['tanggal_ditolak'])
        : null;
    acceptedAt = json['tanggal_diterima'] != null
        ? DateTime.parse(json['tanggal_diterima'])
        : null;
    processedAt = json['tanggal_diproses'] != null
        ? DateTime.parse(json['tanggal_diproses'])
        : null;
    readydAt = json['tanggal_siap'] != null
        ? DateTime.parse(json['tanggal_siap'])
        : null;
    pickupAt = json['tanggal_diambil'] != null
        ? DateTime.parse(json['tanggal_diambil'])
        : null;
    completedAt = json['tanggal_selesai'] != null
        ? DateTime.parse(json['tanggal_selesai'])
        : null;
    pointsUsed = json['poin_digunakan'];
    pointsEarned = json['poin_diperoleh'];
    total = (json['total'] as num).toDouble();
    deliveryMethod = json['jenis_pengiriman'];
    status = json['status_transaksi'];
    payment = Payment.fromJson(json['pembayaran']);
    if (json['detail_transaksi'] != null) {
      transactionDetails = <TransactionDetails>[];
      json['detail_transaksi'].forEach((item) {
        transactionDetails!.add(TransactionDetails.fromJson(item));
      });
    }
  }
}
