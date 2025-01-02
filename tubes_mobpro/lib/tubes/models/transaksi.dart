class Transaksi {
  final int idTransaksi;
  final int idMotor;
  final int idPelanggan;
  final String tanggalMulai;
  final String tanggalSelesai;
  final String statusTransaksi;
  final int durasi;
  final double nominal;

  Transaksi({
    required this.idTransaksi,
    required this.idMotor,
    required this.idPelanggan,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.statusTransaksi,
    required this.durasi,
    required this.nominal,
  });

  factory Transaksi.fromJson(Map<String, dynamic> json) {
    return Transaksi(
      idTransaksi: json['id_transaksi'],
      idMotor: json['id_motor'],
      idPelanggan: json['id_pelanggan'],
      tanggalMulai: json['tanggal_mulai'],
      tanggalSelesai: json['tanggal_selesai'],
      statusTransaksi: json['status_transaksi'],
      durasi: json['durasi'],
      nominal: double.parse(json['nominal'].toString()),
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
