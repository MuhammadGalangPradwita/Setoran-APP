class Transaksi {
  final int id;
  final int idMotor;
  final int idPelanggan;
  final DateTime tanggalMulai;
  final DateTime tanggalSelesai;
  final String status;
  final int durasi;
  final int nominal;
  final DateTime createdAt;

  Transaksi({
    required this.id,
    required this.idMotor,
    required this.idPelanggan,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.status,
    required this.durasi,
    required this.nominal,
    required this.createdAt,
  });

  factory Transaksi.fromJson(Map<String, dynamic> json) {
    return Transaksi(
      id: json["id_transaksi"],
      idMotor: json["id_motor"],
      idPelanggan: json["id_pelanggan"],
      tanggalMulai: DateTime.parse(json["tanggal_mulai"]),
      tanggalSelesai: DateTime.parse(json["tanggal_selesai"]),
      status: json["status_transaksi"],
      durasi: json["durasi"],
      nominal: json["nominal"],
      createdAt: DateTime.parse(json["created_at"]),
    );
  }
}
