//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeviceToken {
  /// Returns a new [DeviceToken] instance.
  DeviceToken({
    this.idToken,
    this.idPengguna,
    this.pengguna,
    this.token,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idToken;

  String? idPengguna;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Pengguna? pengguna;

  String? token;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeviceToken &&
    other.idToken == idToken &&
    other.idPengguna == idPengguna &&
    other.pengguna == pengguna &&
    other.token == token;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idToken == null ? 0 : idToken!.hashCode) +
    (idPengguna == null ? 0 : idPengguna!.hashCode) +
    (pengguna == null ? 0 : pengguna!.hashCode) +
    (token == null ? 0 : token!.hashCode);

  @override
  String toString() => 'DeviceToken[idToken=$idToken, idPengguna=$idPengguna, pengguna=$pengguna, token=$token]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.idToken != null) {
      json[r'idToken'] = this.idToken;
    } else {
      json[r'idToken'] = null;
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
    if (this.token != null) {
      json[r'token'] = this.token;
    } else {
      json[r'token'] = null;
    }
    return json;
  }

  /// Returns a new [DeviceToken] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeviceToken? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DeviceToken[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DeviceToken[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DeviceToken(
        idToken: mapValueOfType<int>(json, r'idToken'),
        idPengguna: mapValueOfType<String>(json, r'idPengguna'),
        pengguna: Pengguna.fromJson(json[r'pengguna']),
        token: mapValueOfType<String>(json, r'token'),
      );
    }
    return null;
  }

  static List<DeviceToken> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DeviceToken>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeviceToken.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeviceToken> mapFromJson(dynamic json) {
    final map = <String, DeviceToken>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeviceToken.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeviceToken-objects as value to a dart map
  static Map<String, List<DeviceToken>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DeviceToken>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DeviceToken.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

