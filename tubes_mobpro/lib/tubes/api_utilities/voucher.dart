import 'dart:convert';

import 'package:tubes_mobpro/tubes/api_utilities/utliities.dart';
import 'package:tubes_mobpro/tubes/models/voucher.dart';
import 'package:tubes_mobpro/tubes/models/voucher_used.dart';

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
    var response = await BaseApi.getAuth("/api/voucher/active");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;

      return data.map((json) => Voucher.fromJson(json)).toList();
    }

    throw Exception("Exception: ${response.body}");
  }

  static Future<Voucher?> checkVoucher(String kodeVoucher) async {
    var response = await BaseApi.getAuth("/api/voucher/check/$kodeVoucher");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['valid']) {
        return Voucher.fromJson(data['voucher']);
      }
      // kode voucher tidak ditemukan/tidak valid
      return null;
    }

    throw Exception("Exception: ${response.body}");
  }

  static Future<bool> isUsed(int idPelanggan, int idVoucher) async {
    var response = await BaseApi.getAuth("/api/voucher/used/$idVoucher");


    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;

      var voucherList = data.map((json) => VoucherUsed.fromJson(json)).toList();

      bool exists = voucherList.any((v) => v.idPengguna == idPelanggan);

      return exists;
    }

    throw Exception("Exception: ${response.body}");
  }
}
