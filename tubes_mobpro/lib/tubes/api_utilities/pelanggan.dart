import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/pelanggan.dart';

class PelangganApi extends BaseApi {
  static Future<Pelanggan?> getCurrentPelanggan(int idPengguna) async {
    var response = await BaseApi.getAuth("/api/pelanggan/$idPengguna");
    if (response.ok) {
      return Pelanggan.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<void> updatePelanggan(Pelanggan pelanggan) async {
    var response = await BaseApi.putAuth(
      "/api/pelanggan/${pelanggan.id}",
      jsonEncode(pelanggan.toJson()),
    );

    if (!response.ok) {
      throw Exception("Error updating pelanggan: ${response.body}");
    }
  }
}
