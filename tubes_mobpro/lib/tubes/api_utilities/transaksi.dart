import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/transaksi.dart';

class TransaksiApi extends BaseApi {
  static Future<List<Transaksi>?> getByPelanggan(int idPelanggan) async {
    var response =
        await BaseApi.getAuth("/api/transaksi/pelanggan/$idPelanggan");
    print("___fetrchTransaksi");
    print(response.body);
    if (response.ok) {
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Transaksi.fromJson(json)).toList();
    }

    return null;
  }
}
