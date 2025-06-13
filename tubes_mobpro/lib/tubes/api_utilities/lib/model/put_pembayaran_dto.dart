//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PutPembayaranDTO {
  /// Returns a new [PutPembayaranDTO] instance.
  PutPembayaranDTO({
    this.metodePembayaran,
    this.statusPembayaran,
    this.tanggalPembayaran,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  MetodePembayaran? metodePembayaran;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  StatusPembayaran? statusPembayaran;

  DateTime? tanggalPembayaran;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PutPembayaranDTO &&
    other.metodePembayaran == metodePembayaran &&
    other.statusPembayaran == statusPembayaran &&
    other.tanggalPembayaran == tanggalPembayaran;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (metodePembayaran == null ? 0 : metodePembayaran!.hashCode) +
    (statusPembayaran == null ? 0 : statusPembayaran!.hashCode) +
    (tanggalPembayaran == null ? 0 : tanggalPembayaran!.hashCode);

  @override
  String toString() => 'PutPembayaranDTO[metodePembayaran=$metodePembayaran, statusPembayaran=$statusPembayaran, tanggalPembayaran=$tanggalPembayaran]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    return json;
  }

  /// Returns a new [PutPembayaranDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PutPembayaranDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PutPembayaranDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PutPembayaranDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PutPembayaranDTO(
        metodePembayaran: MetodePembayaran.fromJson(json[r'metodePembayaran']),
        statusPembayaran: StatusPembayaran.fromJson(json[r'statusPembayaran']),
        tanggalPembayaran: mapDateTime(json, r'tanggalPembayaran', r''),
      );
    }
    return null;
  }

  static List<PutPembayaranDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PutPembayaranDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PutPembayaranDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PutPembayaranDTO> mapFromJson(dynamic json) {
    final map = <String, PutPembayaranDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PutPembayaranDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PutPembayaranDTO-objects as value to a dart map
  static Map<String, List<PutPembayaranDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PutPembayaranDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PutPembayaranDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

