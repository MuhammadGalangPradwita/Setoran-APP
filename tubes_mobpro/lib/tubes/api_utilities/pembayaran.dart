import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/pembayaran.dart';

class PembayaranApi extends BaseApi {
  static Future<Pembayaran> getByIdTransaksi(int idTransaksi) async {
    var response =
        await BaseApi.getAuth('/api/pembayaran/transaksi/$idTransaksi');

    if (response.statusCode == 200) {
      return Pembayaran.fromJson(jsonDecode(response.body));
    }

    throw Exception('Exception: ${response.body}');
  }
}
