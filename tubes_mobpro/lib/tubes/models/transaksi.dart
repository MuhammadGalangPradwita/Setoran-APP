class Transaksi {
  final int idMotor;
  final int idPelanggan;
  final DateTime tanggalMulai;
  final DateTime tanggalSelesai;
  final int durasi;
  final int nominal;
  final DateTime createdAt;
  final int idTransaksi;
  final String statusTransaksi;

  Transaksi({
    required this.idTransaksi,
    required this.idMotor,
    required this.idPelanggan,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.durasi,
    required this.nominal,
    required this.createdAt,
    required this.statusTransaksi,
  });

  factory Transaksi.fromJson(Map<String, dynamic> json) {
    return Transaksi(
      idTransaksi: json['id_transaksi'],
      idMotor: json["id_motor"],
      idPelanggan: json["id_pelanggan"],
      tanggalMulai: DateTime.parse(json["tanggal_mulai"]),
      tanggalSelesai: DateTime.parse(json["tanggal_selesai"]),
      durasi: json["durasi"],
      nominal: json["nominal"],
      createdAt: DateTime.parse(json["created_at"]),
      statusTransaksi: json['status_transaksi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_transaksi': idTransaksi,
      'id_motor': idMotor,
      'id_pelanggan': idPelanggan,
      'tanggal_mulai': tanggalMulai,
      'tanggal_selesai': tanggalSelesai,
      'status_transaksi': statusTransaksi,
      'durasi': durasi,
      'nominal': nominal,
    };
  }
}
