import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/motor.dart';

class MotorAPi extends BaseApi {
  static Future<List<Motor>> getAll() async {
    var response = await BaseApi.getAuth("/api/generic/motors");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;

      return data.map((json) => Motor.fromJson(json)).toList();
    }

    throw Exception("Exception: ${response.body}");
  }

  static Future<Motor?> getById(int id) async {
    var response = await BaseApi.getAuth("/api/generic/motors/$id");

    if (response.statusCode == 200) {
      return Motor.fromJson(jsonDecode(response.body));
    }
  }
}
