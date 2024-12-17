import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'motor.dart';

class MotorService extends ChangeNotifier {
  static const String apiUrl = 'https://de5a-2a09-bac5-d562-88c-00-da-142.ngrok-free.app/api/motors';

  List<Motor> _motors = [];

  List<Motor> get motors => _motors;

  Future<List<Motor>> fetchAll() async {
    final response = await http.get(Uri.parse(apiUrl), headers: {'User-Agent':'CustomUserAgent'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;

      _motors = data.map((json) => Motor.fromJson(json)).toList();
      return _motors;
    } else {
      throw Exception('Failed to fetch motor data');
    }
  }

  Future<Motor> fetch(int id) async {
    final response = await http.get(Uri.parse(apiUrl + '/$id'), headers: {'User-Agent':'CustomUserAgent'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final motor = Motor.fromJson(data);
      return motor;
    } else {
      throw Exception('Failed to fetch motor data');
    }
  }

}
