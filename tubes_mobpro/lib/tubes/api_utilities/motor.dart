

import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/motor.dart';

class MotorAPi extends BaseApi {

  static Future<List<Motor>> getAll() async {
      var response = await BaseApi.getAuth("/api/motors");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;

        return data.map((json) => Motor.fromJson(json)).toList();
      }

      throw Exception("Exception: ${response.body}");
  }
}