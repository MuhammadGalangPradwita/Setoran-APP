
import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:http/http.dart' as http;

// belum ada register sebagai apa nya (pelanggan/mitra)
class AuthApi extends BaseApi {
  static Future<bool> login(String email, String password) async {
    var response = await http.post(Uri.parse(BaseApi.backendHost + "/api/login"), 
      body:{
        "email": email,
        "password": password
      },
      headers: {
      'Accept': 'application/json',
      }
    );

    // kadang ada return message/error dari backend, return type nya bisa di ubah kalau mau pake
    if (response.ok) {
      final data = jsonDecode(response.body);

      BaseApi.storage.write(key: "access_token", value: data["access_token"]);
      return true;
    }

    return false;
  }

  static Future<bool> register(String username, String email, String password) async {
    var response = await http.post(Uri.parse(BaseApi.backendHost + "/api/register"), 
      body:{
        "nama": username,
        "email": email,
        "password": password
      },
      headers: {
      'Accept': 'application/json',
      }
    );

    // kadang ada return message/error dari backend, return type nya bisa di ubah kalau mau pake
    if (response.ok) {
      return true;
    }
    
    print(response.body);
    return false;
  }

  static Future<void> logout() async {
    BaseApi.storage.delete(key: "access_token");
  }
}