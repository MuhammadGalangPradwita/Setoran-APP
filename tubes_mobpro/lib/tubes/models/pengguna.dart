

class Pengguna {
  final int id;
  final String nama;
  final String email;


  Pengguna({
    required this.id,
    required this.nama,
    required this.email,
  });

    factory Pengguna.fromJson(Map<String, dynamic> json) {
    return Pengguna(
      id: json["id_pengguna"],
      nama: json["nama"],
      email: json["email"]
    );
  }
  
}
