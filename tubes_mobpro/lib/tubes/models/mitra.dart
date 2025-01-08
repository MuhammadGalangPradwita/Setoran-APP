import 'package:flutter/foundation.dart';

class Mitra {
  final int idMitra;
  final int idPengguna;

  Mitra({required this.idMitra, required this.idPengguna});

  factory Mitra.fromJson(Map<String, dynamic> json) {
    return Mitra(idMitra: json["id_mitra"], idPengguna: json["id_pengguna"]);
  }
}
