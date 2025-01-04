class Pembayaran {
  final int id;
  final int idTransaksi;
  final String metode;
  final int nominal;
  final String statusPembayaran;
  final DateTime? tanggalBayar;

  Pembayaran({
    required this.id,
    required this.idTransaksi,
    required this.metode,
    required this.nominal,
    required this.statusPembayaran,
    this.tanggalBayar,
  });

  factory Pembayaran.fromJson(Map<String, dynamic> json) {
    return Pembayaran(
      id: json["id_pembayaran"],
      idTransaksi: json["id_transaksi"],
      metode: json["metode"],
      nominal: json["nominal"],
      statusPembayaran: json["status_pembayaran"],
      tanggalBayar: json["tanggal_bayar"] != null
          ? DateTime.parse(json["tanggal_bayar"])
          : null,
    );
  }
}
