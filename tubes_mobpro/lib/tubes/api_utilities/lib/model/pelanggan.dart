//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Pelanggan {
  /// Returns a new [Pelanggan] instance.
  Pelanggan({
    this.idPelanggan,
    this.idPengguna,
    this.pengguna,
    this.nomorSIM,
    this.usedVouchers = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idPelanggan;

  String? idPengguna;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Pengguna? pengguna;

  String? nomorSIM;

  List<Voucher>? usedVouchers;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Pelanggan &&
    other.idPelanggan == idPelanggan &&
    other.idPengguna == idPengguna &&
    other.pengguna == pengguna &&
    other.nomorSIM == nomorSIM &&
    _deepEquality.equals(other.usedVouchers, usedVouchers);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idPelanggan == null ? 0 : idPelanggan!.hashCode) +
    (idPengguna == null ? 0 : idPengguna!.hashCode) +
    (pengguna == null ? 0 : pengguna!.hashCode) +
    (nomorSIM == null ? 0 : nomorSIM!.hashCode) +
    (usedVouchers == null ? 0 : usedVouchers!.hashCode);

  @override
  String toString() => 'Pelanggan[idPelanggan=$idPelanggan, idPengguna=$idPengguna, pengguna=$pengguna, nomorSIM=$nomorSIM, usedVouchers=$usedVouchers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.idPelanggan != null) {
      json[r'idPelanggan'] = this.idPelanggan;
    } else {
      json[r'idPelanggan'] = null;
    }
    if (this.idPengguna != null) {
      json[r'idPengguna'] = this.idPengguna;
    } else {
      json[r'idPengguna'] = null;
    }
    if (this.pengguna != null) {
      json[r'pengguna'] = this.pengguna;
    } else {
      json[r'pengguna'] = null;
    }
    if (this.nomorSIM != null) {
      json[r'nomorSIM'] = this.nomorSIM;
    } else {
      json[r'nomorSIM'] = null;
    }
    if (this.usedVouchers != null) {
      json[r'usedVouchers'] = this.usedVouchers;
    } else {
      json[r'usedVouchers'] = null;
    }
    return json;
  }

  /// Returns a new [Pelanggan] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Pelanggan? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Pelanggan[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Pelanggan[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Pelanggan(
        idPelanggan: mapValueOfType<int>(json, r'idPelanggan'),
        idPengguna: mapValueOfType<String>(json, r'idPengguna'),
        pengguna: Pengguna.fromJson(json[r'pengguna']),
        nomorSIM: mapValueOfType<String>(json, r'nomorSIM'),
        usedVouchers: Voucher.listFromJson(json[r'usedVouchers']),
      );
    }
    return null;
  }

  static List<Pelanggan> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Pelanggan>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Pelanggan.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Pelanggan> mapFromJson(dynamic json) {
    final map = <String, Pelanggan>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Pelanggan.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Pelanggan-objects as value to a dart map
  static Map<String, List<Pelanggan>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Pelanggan>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Pelanggan.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

