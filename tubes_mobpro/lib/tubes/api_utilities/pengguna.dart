import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/pengguna.dart';

class PenggunaApi extends BaseApi {
  static Future<Pengguna?> getCurrentUser() async {
    var response = await BaseApi.getAuth("/api/current-user");

    if (response.ok) {
      return Pengguna.fromJson(jsonDecode(response.body)["user"]);
    }

    // user belum login
    return null;
  }

  static Future<void> updatePengguna(Pengguna pengguna) async {
    var response = await BaseApi.putAuth(
      "/api/pengguna/${pengguna.id}",
      jsonEncode(pengguna.toJson()),
    );

    if (!response.ok) {
      throw Exception("Error updating pelanggan: ${response.body}");
    }
  }
}
