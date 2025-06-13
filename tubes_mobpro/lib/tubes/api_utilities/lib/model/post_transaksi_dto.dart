//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostTransaksiDTO {
  /// Returns a new [PostTransaksiDTO] instance.
  PostTransaksiDTO({
    required this.idMotor,
    required this.idPelanggan,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.metodePembayaran,
    this.idVoucher,
    this.idDiscount,
  });

  int idMotor;

  int idPelanggan;

  DateTime tanggalMulai;

  DateTime tanggalSelesai;

  MetodePembayaran metodePembayaran;

  int? idVoucher;

  int? idDiscount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostTransaksiDTO &&
    other.idMotor == idMotor &&
    other.idPelanggan == idPelanggan &&
    other.tanggalMulai == tanggalMulai &&
    other.tanggalSelesai == tanggalSelesai &&
    other.metodePembayaran == metodePembayaran &&
    other.idVoucher == idVoucher &&
    other.idDiscount == idDiscount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idMotor.hashCode) +
    (idPelanggan.hashCode) +
    (tanggalMulai.hashCode) +
    (tanggalSelesai.hashCode) +
    (metodePembayaran.hashCode) +
    (idVoucher == null ? 0 : idVoucher!.hashCode) +
    (idDiscount == null ? 0 : idDiscount!.hashCode);

  @override
  String toString() => 'PostTransaksiDTO[idMotor=$idMotor, idPelanggan=$idPelanggan, tanggalMulai=$tanggalMulai, tanggalSelesai=$tanggalSelesai, metodePembayaran=$metodePembayaran, idVoucher=$idVoucher, idDiscount=$idDiscount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'idMotor'] = this.idMotor;
      json[r'idPelanggan'] = this.idPelanggan;
      json[r'tanggalMulai'] = this.tanggalMulai.toUtc().toIso8601String();
      json[r'tanggalSelesai'] = this.tanggalSelesai.toUtc().toIso8601String();
      json[r'metodePembayaran'] = this.metodePembayaran;
    if (this.idVoucher != null) {
      json[r'idVoucher'] = this.idVoucher;
    } else {
      json[r'idVoucher'] = null;
    }
    if (this.idDiscount != null) {
      json[r'idDiscount'] = this.idDiscount;
    } else {
      json[r'idDiscount'] = null;
    }
    return json;
  }

  /// Returns a new [PostTransaksiDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostTransaksiDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PostTransaksiDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PostTransaksiDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PostTransaksiDTO(
        idMotor: mapValueOfType<int>(json, r'idMotor')!,
        idPelanggan: mapValueOfType<int>(json, r'idPelanggan')!,
        tanggalMulai: mapDateTime(json, r'tanggalMulai', r'')!,
        tanggalSelesai: mapDateTime(json, r'tanggalSelesai', r'')!,
        metodePembayaran: MetodePembayaran.fromJson(json[r'metodePembayaran'])!,
        idVoucher: mapValueOfType<int>(json, r'idVoucher'),
        idDiscount: mapValueOfType<int>(json, r'idDiscount'),
      );
    }
    return null;
  }

  static List<PostTransaksiDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostTransaksiDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostTransaksiDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostTransaksiDTO> mapFromJson(dynamic json) {
    final map = <String, PostTransaksiDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostTransaksiDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostTransaksiDTO-objects as value to a dart map
  static Map<String, List<PostTransaksiDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostTransaksiDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostTransaksiDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'idMotor',
    'idPelanggan',
    'tanggalMulai',
    'tanggalSelesai',
    'metodePembayaran',
  };
}

