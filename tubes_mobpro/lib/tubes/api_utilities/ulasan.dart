

import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';

class UlasanApi extends BaseApi {
  static Future<double?> getMotorAvg(int idMotor) async {
       var response = await BaseApi.getAuth("/api/ulasan/motor-avg/$idMotor");

    if (response.ok) {

      return jsonDecode(response.body)["average_rating"];
    }

    // user belum login
    return null;
  }
}
