import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';

extension MotorHelper on Motor {
  /// pastikan list diskon sudah ter load di objek motor
  Diskon? getBestDiscount() {
    Diskon? diskonTerbaik = null;

    for (Diskon discount in diskon ?? []) {
      if (discount.tanggalMulai!.isBefore(DateTime.now()) &&
          discount.tanggalAkhir!.isAfter(DateTime.now())) {
        if (diskonTerbaik != null &&
            discount.jumlahDiskon! > diskonTerbaik.jumlahDiskon!) {
          diskonTerbaik = discount;
        } else if (diskonTerbaik == null) {
          diskonTerbaik = discount;
        }
      }
    }

    return diskonTerbaik;
  }

  /// pastikan list ulasan sudah ter load di objek motor
  double? getAvgUlasan() {
    if (ulasan == null || ulasan!.isEmpty) return null;

    double total =
        ulasan!.fold(0.0, (sum, ulasan) => sum + ulasan.rating!.toDouble());

    return total / ulasan!.length;
  }

  // Mengambil daftar motor yang sudah dibooking
  static List<Motor>? removeBookedMotors(List<Motor>? listMotors) {
    List<Motor> filteredList = [];

    if (listMotors == null || listMotors.isEmpty) {
      return [];
    }

    // Menghapus motor yang sudah dibooking dari daftar
    for (var motor in listMotors!) {
      if (motor.statusMotor == StatusMotor.tersedia) {
        if (motor.platNomor == "E2365CTYL") {}
        filteredList.add(motor);
      }
    }

    // Mengembalikan daftar motor yang sudah dibooking
    return filteredList;
  }

  double? calculateAverageRating(List<Ulasan> ulasan) {
    double totalRating = 0;
    int count = 0;

    for (var ulasan in ulasan) {
      if (ulasan.idMotor == idMotor) {
        totalRating += ulasan.rating!;
        count++;
      }
    }

    return count > 0 ? totalRating / count : null;
  }
}
