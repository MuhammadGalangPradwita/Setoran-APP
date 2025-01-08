import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';

class ImageApi extends BaseApi {
  static Future<int?> uploadImage(File image, String label) async {
    try {
      final uri = Uri.parse(
          BaseApi.backendHost + '/api/image'); // Replace with your backend URL
      final request = http.MultipartRequest('POST', uri);

      request.files.add(await http.MultipartFile.fromPath('image', image.path));

      request.fields['label'] = label;

      request.headers.addAll({
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${BaseApi.storage.read(key: "access_token")}"
      });

      final response = await request.send();

      if (response.statusCode == 201) {
        final responseBody = await response.stream.bytesToString();
        final data = jsonDecode(responseBody);

        return data['id'];
      } else {
        print("Error: ${http.Response.fromStream(response).then((val) {
          print(val.body);
        })}");
        return null;
      }
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  static NetworkImage getImage(int id) {
    return NetworkImage(BaseApi.backendHost + "/api/image/$id", headers: {
      "Authorization": "Bearer ${BaseApi.storage.read(key: "access_token")}"
    });
  }

  static Image getImageImage(int id) {
    final result = NetworkImage(BaseApi.backendHost + "/api/image/$id",
        headers: {
          "Authorization": "Bearer ${BaseApi.storage.read(key: "access_token")}"
        });
    return Image.network(result.url);
  }
}
