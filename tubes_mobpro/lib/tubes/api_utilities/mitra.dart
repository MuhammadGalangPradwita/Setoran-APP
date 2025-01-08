import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/mitra.dart';

class MitraApi extends BaseApi {
  static Future<Mitra?> getMitraByIdPengguna(int idPengguna) async {
    final response = await BaseApi.getAuth("/api/mitras/pengguna/$idPengguna");
    if (response.ok) {
      return Mitra.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
