//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostVoucherDTO {
  /// Returns a new [PostVoucherDTO] instance.
  PostVoucherDTO({
    required this.namaVoucher,
    required this.statusVoucher,
    required this.tanggalMulai,
    required this.tanggalAkhir,
    required this.persenVoucher,
    required this.kodeVoucher,
  });

  String namaVoucher;

  StatusVoucher statusVoucher;

  DateTime tanggalMulai;

  DateTime tanggalAkhir;

  /// Minimum value: 1
  /// Maximum value: 100
  int persenVoucher;

  String kodeVoucher;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostVoucherDTO &&
    other.namaVoucher == namaVoucher &&
    other.statusVoucher == statusVoucher &&
    other.tanggalMulai == tanggalMulai &&
    other.tanggalAkhir == tanggalAkhir &&
    other.persenVoucher == persenVoucher &&
    other.kodeVoucher == kodeVoucher;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (namaVoucher.hashCode) +
    (statusVoucher.hashCode) +
    (tanggalMulai.hashCode) +
    (tanggalAkhir.hashCode) +
    (persenVoucher.hashCode) +
    (kodeVoucher.hashCode);

  @override
  String toString() => 'PostVoucherDTO[namaVoucher=$namaVoucher, statusVoucher=$statusVoucher, tanggalMulai=$tanggalMulai, tanggalAkhir=$tanggalAkhir, persenVoucher=$persenVoucher, kodeVoucher=$kodeVoucher]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'namaVoucher'] = this.namaVoucher;
      json[r'statusVoucher'] = this.statusVoucher;
      json[r'tanggalMulai'] = this.tanggalMulai.toUtc().toIso8601String();
      json[r'tanggalAkhir'] = this.tanggalAkhir.toUtc().toIso8601String();
      json[r'persenVoucher'] = this.persenVoucher;
      json[r'kodeVoucher'] = this.kodeVoucher;
    return json;
  }

  /// Returns a new [PostVoucherDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostVoucherDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PostVoucherDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PostVoucherDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PostVoucherDTO(
        namaVoucher: mapValueOfType<String>(json, r'namaVoucher')!,
        statusVoucher: StatusVoucher.fromJson(json[r'statusVoucher'])!,
        tanggalMulai: mapDateTime(json, r'tanggalMulai', r'')!,
        tanggalAkhir: mapDateTime(json, r'tanggalAkhir', r'')!,
        persenVoucher: mapValueOfType<int>(json, r'persenVoucher')!,
        kodeVoucher: mapValueOfType<String>(json, r'kodeVoucher')!,
      );
    }
    return null;
  }

  static List<PostVoucherDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostVoucherDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostVoucherDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostVoucherDTO> mapFromJson(dynamic json) {
    final map = <String, PostVoucherDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostVoucherDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostVoucherDTO-objects as value to a dart map
  static Map<String, List<PostVoucherDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostVoucherDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostVoucherDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'namaVoucher',
    'statusVoucher',
    'tanggalMulai',
    'tanggalAkhir',
    'persenVoucher',
    'kodeVoucher',
  };
}

