

import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';

extension MotorHelper on Motor {

  /// pastikan list diskon sudah ter load di objek motor
  Diskon? getBestDiscount() {
    Diskon? diskonTerbaik = null;

    for (Diskon discount in diskon ?? []) {
      if (discount.tanggalMulai!.isBefore(DateTime.now()) &&
          discount.tanggalAkhir!.isAfter(DateTime.now())) {
        if (diskonTerbaik !=null && discount.jumlahDiskon! > diskonTerbaik.jumlahDiskon!) {
          diskonTerbaik = discount;
        } else if (diskonTerbaik == null) {
          diskonTerbaik = discount;
        }
      }
    }

    return diskonTerbaik;
  }

  /// pastikan list ulasan sudah ter load di objek motor
  Future<double?> getAvgUlasan() async {
    if (ulasan == null || ulasan!.isEmpty) return null;

    double total = ulasan!.fold(0.0, (sum, ulasan) => sum + ulasan.rating!.toDouble());
    return total / ulasan!.length;
  }
}