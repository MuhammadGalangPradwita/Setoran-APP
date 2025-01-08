import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/image_data.dart';

class ImageDataApi extends BaseApi {
  static Future<ImageData?> getImage(int id) async {
    final response = await BaseApi.getImageAuth("/api/image/$id");
    if (response.ok) {
      return ImageData.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
