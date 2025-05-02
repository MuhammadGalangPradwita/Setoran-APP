//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Pembayaran {
  /// Returns a new [Pembayaran] instance.
  Pembayaran({
    this.idPembayaran,
    this.idTransaksi,
    this.metodePembayaran,
    this.statusPembayaran,
    this.tanggalPembayaran,
    this.transaksi,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idPembayaran;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idTransaksi;

  String? metodePembayaran;

  String? statusPembayaran;

  DateTime? tanggalPembayaran;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Transaksi? transaksi;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Pembayaran &&
    other.idPembayaran == idPembayaran &&
    other.idTransaksi == idTransaksi &&
    other.metodePembayaran == metodePembayaran &&
    other.statusPembayaran == statusPembayaran &&
    other.tanggalPembayaran == tanggalPembayaran &&
    other.transaksi == transaksi;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idPembayaran == null ? 0 : idPembayaran!.hashCode) +
    (idTransaksi == null ? 0 : idTransaksi!.hashCode) +
    (metodePembayaran == null ? 0 : metodePembayaran!.hashCode) +
    (statusPembayaran == null ? 0 : statusPembayaran!.hashCode) +
    (tanggalPembayaran == null ? 0 : tanggalPembayaran!.hashCode) +
    (transaksi == null ? 0 : transaksi!.hashCode);

  @override
  String toString() => 'Pembayaran[idPembayaran=$idPembayaran, idTransaksi=$idTransaksi, metodePembayaran=$metodePembayaran, statusPembayaran=$statusPembayaran, tanggalPembayaran=$tanggalPembayaran, transaksi=$transaksi]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.idPembayaran != null) {
      json[r'idPembayaran'] = this.idPembayaran;
    } else {
      json[r'idPembayaran'] = null;
    }
    if (this.idTransaksi != null) {
      json[r'idTransaksi'] = this.idTransaksi;
    } else {
      json[r'idTransaksi'] = null;
    }
    if (this.metodePembayaran != null) {
      json[r'metodePembayaran'] = this.metodePembayaran;
    } else {
      json[r'metodePembayaran'] = null;
    }
    if (this.statusPembayaran != null) {
      json[r'statusPembayaran'] = this.statusPembayaran;
    } else {
      json[r'statusPembayaran'] = null;
    }
    if (this.tanggalPembayaran != null) {
      json[r'tanggalPembayaran'] = this.tanggalPembayaran!.toUtc().toIso8601String();
    } else {
      json[r'tanggalPembayaran'] = null;
    }
    if (this.transaksi != null) {
      json[r'transaksi'] = this.transaksi;
    } else {
      json[r'transaksi'] = null;
    }
    return json;
  }

  /// Returns a new [Pembayaran] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Pembayaran? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Pembayaran[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Pembayaran[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Pembayaran(
        idPembayaran: mapValueOfType<int>(json, r'idPembayaran'),
        idTransaksi: mapValueOfType<int>(json, r'idTransaksi'),
        metodePembayaran: mapValueOfType<String>(json, r'metodePembayaran'),
        statusPembayaran: mapValueOfType<String>(json, r'statusPembayaran'),
        tanggalPembayaran: mapDateTime(json, r'tanggalPembayaran', r''),
        transaksi: Transaksi.fromJson(json[r'transaksi']),
      );
    }
    return null;
  }

  static List<Pembayaran> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Pembayaran>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Pembayaran.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Pembayaran> mapFromJson(dynamic json) {
    final map = <String, Pembayaran>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Pembayaran.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Pembayaran-objects as value to a dart map
  static Map<String, List<Pembayaran>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Pembayaran>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Pembayaran.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

