

import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/voucher.dart';

class VoucherAPi extends BaseApi {

  static Future<List<Voucher>> getAll() async {
      var response = await BaseApi.getAuth("/api/vouchers");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;

        return data.map((json) => Voucher.fromJson(json)).toList();
      }

      throw Exception("Exception: ${response.body}");
  }
}