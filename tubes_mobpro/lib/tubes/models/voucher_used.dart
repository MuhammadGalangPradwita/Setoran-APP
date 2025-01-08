class VoucherUsed {
  final int id;
  final int idVoucher;
  final int idPengguna;

  VoucherUsed({
    required this.id,
    required this.idVoucher,
    required this.idPengguna,
  });

  // Factory method to create a VoucherUsed object from a JSON map
  factory VoucherUsed.fromJson(Map<String, dynamic> json) {
    return VoucherUsed(
      id: json['id'],
      idVoucher: json['id_voucher'],
      idPengguna: json['id_pengguna'],
    );
  }

  // Method to convert a VoucherUsed object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_voucher': idVoucher,
      'id_pengguna': idPengguna,
    };
  }
}
