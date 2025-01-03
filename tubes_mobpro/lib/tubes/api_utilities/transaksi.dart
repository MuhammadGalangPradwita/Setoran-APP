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

  static Future<List<Transaksi>> getAll() async {
    var response = await BaseApi.getAuth("/api/transaksi");

    if (response.ok) {
      final data = jsonDecode(response.body) as List;

      return data.map((json) => Transaksi.fromJson(json)).toList();
    }

    throw Exception("Error fetching transactions: ${response.body}");
  }

  static Future<Transaksi> getTransaksi(int id) async {
    var response = await BaseApi.getAuth("/api/transaksi/$id");

    if (response.ok) {
      final data = jsonDecode(response.body);

      return Transaksi.fromJson(data);
    }

    throw Exception("Error fetching transaction: ${response.body}");
  }

  static Future<String> postTransaksi(
      Map<String, dynamic> transaksiData) async {
    var response = await BaseApi.postAuth(
      "/api/transaksi",
      jsonEncode(transaksiData),
    );

    if (response.ok) {
      final data = jsonDecode(response.body);

      return 'success';
    }

    throw Exception("Error creating transaction: ${response.body}");
  }
}
