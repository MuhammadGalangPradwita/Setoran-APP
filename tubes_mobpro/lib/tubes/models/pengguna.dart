class Pengguna {
  final int id;
  final String nama;
  final String email;
  final String? tanggalLahir;
  final String? nomorTelepon;
  final String? nomorKTP;
  final String? alamat;

  Pengguna(
      {required this.id,
      required this.nama,
      required this.email,
      this.tanggalLahir,
      this.nomorTelepon,
      this.nomorKTP,
      this.alamat});

  factory Pengguna.fromJson(Map<String, dynamic> json) {
    return Pengguna(
        id: json["id_pengguna"],
        nama: json["nama"],
        email: json["email"],
        tanggalLahir: json["tanggal_lahir"],
        nomorTelepon: json["nomor_telepon"],
        nomorKTP: json["nomor_KTP"],
        alamat: json["alamat"]);
  }
}
