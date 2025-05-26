//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Notifikasi {
  /// Returns a new [Notifikasi] instance.
  Notifikasi({
    this.idNotifikasi,
    this.idPengguna,
    this.judul,
    this.deskripsi,
    this.navigasi,
    this.dataNavigasi = const {},
    this.isRead = false,
    this.pengguna,
    this.waktuNotifikasi,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idNotifikasi;

  String? idPengguna;

  String? judul;

  String? deskripsi;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  TargetNavigasi? navigasi;

  Map<String, String>? dataNavigasi;

  bool isRead;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Pengguna? pengguna;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? waktuNotifikasi;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Notifikasi &&
    other.idNotifikasi == idNotifikasi &&
    other.idPengguna == idPengguna &&
    other.judul == judul &&
    other.deskripsi == deskripsi &&
    other.navigasi == navigasi &&
    _deepEquality.equals(other.dataNavigasi, dataNavigasi) &&
    other.isRead == isRead &&
    other.pengguna == pengguna &&
    other.waktuNotifikasi == waktuNotifikasi;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idNotifikasi == null ? 0 : idNotifikasi!.hashCode) +
    (idPengguna == null ? 0 : idPengguna!.hashCode) +
    (judul == null ? 0 : judul!.hashCode) +
    (deskripsi == null ? 0 : deskripsi!.hashCode) +
    (navigasi == null ? 0 : navigasi!.hashCode) +
    (dataNavigasi == null ? 0 : dataNavigasi!.hashCode) +
    (isRead.hashCode) +
    (pengguna == null ? 0 : pengguna!.hashCode) +
    (waktuNotifikasi == null ? 0 : waktuNotifikasi!.hashCode);

  @override
  String toString() => 'Notifikasi[idNotifikasi=$idNotifikasi, idPengguna=$idPengguna, judul=$judul, deskripsi=$deskripsi, navigasi=$navigasi, dataNavigasi=$dataNavigasi, isRead=$isRead, pengguna=$pengguna, waktuNotifikasi=$waktuNotifikasi]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.idNotifikasi != null) {
      json[r'idNotifikasi'] = this.idNotifikasi;
    } else {
      json[r'idNotifikasi'] = null;
    }
    if (this.idPengguna != null) {
      json[r'idPengguna'] = this.idPengguna;
    } else {
      json[r'idPengguna'] = null;
    }
    if (this.judul != null) {
      json[r'judul'] = this.judul;
    } else {
      json[r'judul'] = null;
    }
    if (this.deskripsi != null) {
      json[r'deskripsi'] = this.deskripsi;
    } else {
      json[r'deskripsi'] = null;
    }
    if (this.navigasi != null) {
      json[r'navigasi'] = this.navigasi;
    } else {
      json[r'navigasi'] = null;
    }
    if (this.dataNavigasi != null) {
      json[r'dataNavigasi'] = this.dataNavigasi;
    } else {
      json[r'dataNavigasi'] = null;
    }
      json[r'isRead'] = this.isRead;
    if (this.pengguna != null) {
      json[r'pengguna'] = this.pengguna;
    } else {
      json[r'pengguna'] = null;
    }
    if (this.waktuNotifikasi != null) {
      json[r'waktuNotifikasi'] = this.waktuNotifikasi!.toUtc().toIso8601String();
    } else {
      json[r'waktuNotifikasi'] = null;
    }
    return json;
  }

  /// Returns a new [Notifikasi] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Notifikasi? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Notifikasi[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Notifikasi[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Notifikasi(
        idNotifikasi: mapValueOfType<int>(json, r'idNotifikasi'),
        idPengguna: mapValueOfType<String>(json, r'idPengguna'),
        judul: mapValueOfType<String>(json, r'judul'),
        deskripsi: mapValueOfType<String>(json, r'deskripsi'),
        navigasi: TargetNavigasi.fromJson(json[r'navigasi']),
        dataNavigasi: mapCastOfType<String, String>(json, r'dataNavigasi') ?? const {},
        isRead: mapValueOfType<bool>(json, r'isRead') ?? false,
        pengguna: Pengguna.fromJson(json[r'pengguna']),
        waktuNotifikasi: mapDateTime(json, r'waktuNotifikasi', r''),
      );
    }
    return null;
  }

  static List<Notifikasi> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Notifikasi>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Notifikasi.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Notifikasi> mapFromJson(dynamic json) {
    final map = <String, Notifikasi>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Notifikasi.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Notifikasi-objects as value to a dart map
  static Map<String, List<Notifikasi>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Notifikasi>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Notifikasi.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

