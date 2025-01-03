import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/pengguna.dart';
import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/pelanggan.dart';
import 'package:tubes_mobpro/tubes/models/pengguna.dart';

class PelangganApi extends BaseApi {
  static Future<Pelanggan?> getCurrentPelanggan(int idPengguna) async {
    var response = await BaseApi.getAuth("/api/pelanggan/$idPengguna");
    if (response.ok) {
      return Pelanggan.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
