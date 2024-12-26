class Voucher {
  final int idVoucher;
  final String namaVoucher;
  final String statusVoucher;
  final String tanggalMulai;
  final String tanggalAkhir;

  Voucher({
    required this.idVoucher,
    required this.namaVoucher,
    required this.statusVoucher,
    required this.tanggalMulai,
    required this.tanggalAkhir,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(
      idVoucher: json['id_voucher'],
      namaVoucher: json['nama_voucher'],
      statusVoucher: json['status_voucher'],
      tanggalMulai: json['tanggal_mulai'],
      tanggalAkhir: json['tanggal_akhir'],
    );
  }
}
