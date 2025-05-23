import 'dart:convert';
import 'dart:io';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class BaseApi {
  // asumsi ini, mungkin nanti bisa buat file .env buat set host nya
  static String backendHost = "http://10.0.2.2:8000";

  // bisa ganti nanti ke secure storage
  static LocalStorage storage = LocalStorage();
  // static FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<http.Response> getAuth(String url,
      {Map<String, dynamic> headers = const {}}) async {
    try {
      return await http.get(Uri.parse(backendHost + url), headers: {
        'Accept': 'application/json',
        "Authorization": "Bearer ${storage.read(key: "access_token")}",
        ...headers
      });
    } catch (e) {
      return http.Response(jsonEncode({'error': 'Server is unreachable'}), 503);
    }
  }

  static Future<http.Response> postAuth(String url, String body,
      {Map<String, dynamic> headers = const {}}) async {
    try {
      return await http.post(Uri.parse(backendHost + url),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            "Authorization": "Bearer ${storage.read(key: "access_token")}"
          },
          body: body);
    } catch (e) {
      return http.Response(
          jsonEncode({'error': 'Server is unreachable' + e.toString()}), 503);
    }
  }

  static Future<http.Response> putAuth(String url, String body,
      {Map<String, dynamic> headers = const {}}) async {
    try {
      return await http.put(Uri.parse(backendHost + url),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            "Authorization": "Bearer ${storage.read(key: "access_token")}"
          },
          body: body);
    } catch (e) {
      return http.Response(
          jsonEncode({'error': 'Server is unreachable' + e.toString()}), 503);
    }
  }

  static Future<http.Response> getImageAuth(String url,
      {Map<String, dynamic> headers = const {}}) async {
    try {
      return await http.get(Uri.parse(backendHost + url), headers: {
        'Accept': 'image/jpeg',
        "Authorization": "Bearer ${storage.read(key: "access_token")}",
        ...headers
      });
    } catch (e) {
      return http.Response(jsonEncode({'error': 'Server is unreachable'}), 503);
    }
  }
}

extension IsOk on http.Response {
  bool get ok {
    return (statusCode ~/ 100) == 2;
  }
}

class LocalStorage {
  String read({String key = ""}) {
    return localStorage.getItem(key) ?? "";
  }

  void write({String key = "", dynamic value = ""}) {
    localStorage.setItem(key, value);
  }

  void delete({String key = ""}) {
    localStorage.removeItem(key);
  }
}
