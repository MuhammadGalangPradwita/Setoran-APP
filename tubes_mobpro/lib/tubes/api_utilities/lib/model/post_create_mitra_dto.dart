//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostCreateMitraDTO {
  /// Returns a new [PostCreateMitraDTO] instance.
  PostCreateMitraDTO({
    this.idPengguna,
    this.status,
  });

  String? idPengguna;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  StatusMitra? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostCreateMitraDTO &&
    other.idPengguna == idPengguna &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idPengguna == null ? 0 : idPengguna!.hashCode) +
    (status == null ? 0 : status!.hashCode);

  @override
  String toString() => 'PostCreateMitraDTO[idPengguna=$idPengguna, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.idPengguna != null) {
      json[r'idPengguna'] = this.idPengguna;
    } else {
      json[r'idPengguna'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    return json;
  }

  /// Returns a new [PostCreateMitraDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostCreateMitraDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PostCreateMitraDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PostCreateMitraDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PostCreateMitraDTO(
        idPengguna: mapValueOfType<String>(json, r'idPengguna'),
        status: StatusMitra.fromJson(json[r'status']),
      );
    }
    return null;
  }

  static List<PostCreateMitraDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostCreateMitraDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostCreateMitraDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostCreateMitraDTO> mapFromJson(dynamic json) {
    final map = <String, PostCreateMitraDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostCreateMitraDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostCreateMitraDTO-objects as value to a dart map
  static Map<String, List<PostCreateMitraDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostCreateMitraDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostCreateMitraDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

