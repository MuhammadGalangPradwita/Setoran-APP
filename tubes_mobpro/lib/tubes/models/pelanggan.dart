class Pelanggan {
  final int id;
  final int idPengguna;
  String nomorSIM;

  Pelanggan({
    required this.id,
    required this.idPengguna,
    required this.nomorSIM,
  });

  factory Pelanggan.fromJson(Map<String, dynamic> json) {
    return Pelanggan(
      id: json["id_pelanggan"],
      idPengguna: json["id_pengguna"],
      nomorSIM: json["nomor_SIM"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_pelanggan": id,
      "id_pengguna": idPengguna,
      "nomor_SIM": nomorSIM,
    };
  }
}
