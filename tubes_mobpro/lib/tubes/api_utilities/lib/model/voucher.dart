//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Voucher {
  /// Returns a new [Voucher] instance.
  Voucher({
    this.idVoucher,
    this.namaVoucher,
    this.statusVoucher,
    this.tanggalMulai,
    this.tanggalAkhir,
    this.persenVoucher,
    this.kodeVoucher,
    this.pelanggans = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idVoucher;

  String? namaVoucher;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  StatusVoucher? statusVoucher;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? tanggalMulai;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? tanggalAkhir;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? persenVoucher;

  String? kodeVoucher;

  List<Pelanggan>? pelanggans;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Voucher &&
    other.idVoucher == idVoucher &&
    other.namaVoucher == namaVoucher &&
    other.statusVoucher == statusVoucher &&
    other.tanggalMulai == tanggalMulai &&
    other.tanggalAkhir == tanggalAkhir &&
    other.persenVoucher == persenVoucher &&
    other.kodeVoucher == kodeVoucher &&
    _deepEquality.equals(other.pelanggans, pelanggans);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idVoucher == null ? 0 : idVoucher!.hashCode) +
    (namaVoucher == null ? 0 : namaVoucher!.hashCode) +
    (statusVoucher == null ? 0 : statusVoucher!.hashCode) +
    (tanggalMulai == null ? 0 : tanggalMulai!.hashCode) +
    (tanggalAkhir == null ? 0 : tanggalAkhir!.hashCode) +
    (persenVoucher == null ? 0 : persenVoucher!.hashCode) +
    (kodeVoucher == null ? 0 : kodeVoucher!.hashCode) +
    (pelanggans == null ? 0 : pelanggans!.hashCode);

  @override
  String toString() => 'Voucher[idVoucher=$idVoucher, namaVoucher=$namaVoucher, statusVoucher=$statusVoucher, tanggalMulai=$tanggalMulai, tanggalAkhir=$tanggalAkhir, persenVoucher=$persenVoucher, kodeVoucher=$kodeVoucher, pelanggans=$pelanggans]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.idVoucher != null) {
      json[r'idVoucher'] = this.idVoucher;
    } else {
      json[r'idVoucher'] = null;
    }
    if (this.namaVoucher != null) {
      json[r'namaVoucher'] = this.namaVoucher;
    } else {
      json[r'namaVoucher'] = null;
    }
    if (this.statusVoucher != null) {
      json[r'statusVoucher'] = this.statusVoucher;
    } else {
      json[r'statusVoucher'] = null;
    }
    if (this.tanggalMulai != null) {
      json[r'tanggalMulai'] = this.tanggalMulai!.toUtc().toIso8601String();
    } else {
      json[r'tanggalMulai'] = null;
    }
    if (this.tanggalAkhir != null) {
      json[r'tanggalAkhir'] = this.tanggalAkhir!.toUtc().toIso8601String();
    } else {
      json[r'tanggalAkhir'] = null;
    }
    if (this.persenVoucher != null) {
      json[r'persenVoucher'] = this.persenVoucher;
    } else {
      json[r'persenVoucher'] = null;
    }
    if (this.kodeVoucher != null) {
      json[r'kodeVoucher'] = this.kodeVoucher;
    } else {
      json[r'kodeVoucher'] = null;
    }
    if (this.pelanggans != null) {
      json[r'pelanggans'] = this.pelanggans;
    } else {
      json[r'pelanggans'] = null;
    }
    return json;
  }

  /// Returns a new [Voucher] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Voucher? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Voucher[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Voucher[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Voucher(
        idVoucher: mapValueOfType<int>(json, r'idVoucher'),
        namaVoucher: mapValueOfType<String>(json, r'namaVoucher'),
        statusVoucher: StatusVoucher.fromJson(json[r'statusVoucher']),
        tanggalMulai: mapDateTime(json, r'tanggalMulai', r''),
        tanggalAkhir: mapDateTime(json, r'tanggalAkhir', r''),
        persenVoucher: mapValueOfType<int>(json, r'persenVoucher'),
        kodeVoucher: mapValueOfType<String>(json, r'kodeVoucher'),
        pelanggans: Pelanggan.listFromJson(json[r'pelanggans']),
      );
    }
    return null;
  }

  static List<Voucher> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Voucher>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Voucher.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Voucher> mapFromJson(dynamic json) {
    final map = <String, Voucher>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Voucher.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Voucher-objects as value to a dart map
  static Map<String, List<Voucher>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Voucher>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Voucher.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

