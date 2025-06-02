

import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';

extension MotorHelper on Motor {

  Diskon? GetBestDiscount() {
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

  Future<double?> GetAvgUlasan() async {
    // TODO: update
    return 3.4;
  }
}