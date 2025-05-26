//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Mitra {
  /// Returns a new [Mitra] instance.
  Mitra({
    this.idMitra,
    this.status,
    this.idPengguna,
    this.pengguna,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idMitra;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  StatusMitra? status;

  String? idPengguna;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Pengguna? pengguna;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Mitra &&
    other.idMitra == idMitra &&
    other.status == status &&
    other.idPengguna == idPengguna &&
    other.pengguna == pengguna;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idMitra == null ? 0 : idMitra!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (idPengguna == null ? 0 : idPengguna!.hashCode) +
    (pengguna == null ? 0 : pengguna!.hashCode);

  @override
  String toString() => 'Mitra[idMitra=$idMitra, status=$status, idPengguna=$idPengguna, pengguna=$pengguna]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.idMitra != null) {
      json[r'idMitra'] = this.idMitra;
    } else {
      json[r'idMitra'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
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
    return json;
  }

  /// Returns a new [Mitra] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Mitra? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Mitra[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Mitra[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Mitra(
        idMitra: mapValueOfType<int>(json, r'idMitra'),
        status: StatusMitra.fromJson(json[r'status']),
        idPengguna: mapValueOfType<String>(json, r'idPengguna'),
        pengguna: Pengguna.fromJson(json[r'pengguna']),
      );
    }
    return null;
  }

  static List<Mitra> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Mitra>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Mitra.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Mitra> mapFromJson(dynamic json) {
    final map = <String, Mitra>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Mitra.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Mitra-objects as value to a dart map
  static Map<String, List<Mitra>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Mitra>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Mitra.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

