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

  static Future<List<Motor>> filtered(
      String date, String transmission, String model) async {
    var response = await BaseApi.postAuth(
        "/api/motor/filtered",
        jsonEncode({
          'model': model,
          'date': date,
          'transmission': transmission,
        }));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;

      return data.map((json) => Motor.fromJson(json)).toList();
    }

    throw Exception("Exception: ${response.body}");
  }

  static Future<Motor> getMotor(int id) async {
    var response = await BaseApi.getAuth("/api/generic/motors/${id}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return Motor.fromJson(data);
    }

    throw Exception("Exception: ${response.body}");
  }

  static Future<List<Motor>?> getByMitra(int idMitra) async {
    final response = await BaseApi.getAuth("/api/motor/mitra/$idMitra");

    if (response.ok) {
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Motor.fromJson(json)).toList();
    }

    return [];
  }
}
