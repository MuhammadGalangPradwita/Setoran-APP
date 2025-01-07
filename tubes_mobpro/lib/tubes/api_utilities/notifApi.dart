import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/motor.dart';
import 'package:tubes_mobpro/tubes/models/notifikasi.dart';

class NotifApi extends BaseApi {
  static Future<List<Notifikasi>> getAll() async {
      var response = await BaseApi.getAuth("/api/notif/get-all");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;

        return data.map((json) => Notifikasi.fromJson(json)).toList();
      }

      throw Exception("Exception: ${response.body}");
  }

  static Future<void> read(int notifId) async {
    var response = await BaseApi.getAuth("/api/notif/read/$notifId");

    if (!response.ok) {
      throw Exception("Exception: ${response.body}");
    }
  }

  static Future<void> register(String deviceToken) async {
    var response = await BaseApi.postAuth("/api/notif/register", jsonEncode({
      "device_token": deviceToken
    }));

    if (!response.ok) {
      throw Exception("Exception: ${response.body}");
    }

  }
}
