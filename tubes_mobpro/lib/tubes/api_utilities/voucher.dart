

import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/voucher.dart';

class VoucherAPi extends BaseApi {

  static Future<List<Voucher>> getAll() async {
      var response = await BaseApi.getAuth("/api/generic/vouchers");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;

        return data.map((json) => Voucher.fromJson(json)).toList();
      }

      throw Exception("Exception: ${response.body}");
  }

  static Future<List<Voucher>> getActive() async {
    final String today = DateTime.now().toIso8601String().split('T').first;
    var response = await BaseApi.getAuth("/api/voucher/filtered?status=aktif&start=$today&end=$today");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;

        return data.map((json) => Voucher.fromJson(json)).toList();
      }

      throw Exception("Exception: ${response.body}");
  }
}