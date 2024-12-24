import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/motor.dart';
import 'package:tubes_mobpro/tubes/models/pengguna.dart';

class PenggunaApi extends BaseApi {

  static Future<Pengguna?> getCurrentUser() async {
    var response = await BaseApi.getAuth("/api/current-user");

    if (response.statusCode == 200) {

      return Pengguna.fromJson(jsonDecode(response.body)["user"]);
    }

    // user belum login
    return null;
  }
}