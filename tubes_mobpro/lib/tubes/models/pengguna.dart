class Pengguna {
  final int id;
  int? idGambar;
  String nama;
  String email;
  String? tanggalLahir;
  String? nomorTelepon;
  String? nomorKTP;
  String? alamat;

  Pengguna(
      {required this.id,
      this.idGambar,
      required this.nama,
      required this.email,
      this.tanggalLahir,
      this.nomorTelepon,
      this.nomorKTP,
      this.alamat});

  factory Pengguna.fromJson(Map<String, dynamic> json) {
    return Pengguna(
        id: json["id_pengguna"],
        idGambar: json["id_gambar"],
        nama: json["nama"],
        email: json["email"],
        tanggalLahir: json["tanggal_lahir"],
        nomorTelepon: json["nomor_telepon"],
        nomorKTP: json["nomor_KTP"],
        alamat: json["alamat"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id_pengguna": id,
      "nama": nama,
      "email": email,
      "tanggal_lahir": tanggalLahir,
      "nomor_telepon": nomorTelepon,
      "nomor_KTP": nomorKTP,
      "alamat": alamat
    };
  }
}
