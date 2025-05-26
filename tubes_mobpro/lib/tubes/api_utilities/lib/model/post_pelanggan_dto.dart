//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostPelangganDTO {
  /// Returns a new [PostPelangganDTO] instance.
  PostPelangganDTO({
    required this.idPelanggan,
    this.nomorSIM,
  });

  int idPelanggan;

  String? nomorSIM;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostPelangganDTO &&
    other.idPelanggan == idPelanggan &&
    other.nomorSIM == nomorSIM;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idPelanggan.hashCode) +
    (nomorSIM == null ? 0 : nomorSIM!.hashCode);

  @override
  String toString() => 'PostPelangganDTO[idPelanggan=$idPelanggan, nomorSIM=$nomorSIM]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'idPelanggan'] = this.idPelanggan;
    if (this.nomorSIM != null) {
      json[r'nomorSIM'] = this.nomorSIM;
    } else {
      json[r'nomorSIM'] = null;
    }
    return json;
  }

  /// Returns a new [PostPelangganDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostPelangganDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PostPelangganDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PostPelangganDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PostPelangganDTO(
        idPelanggan: mapValueOfType<int>(json, r'idPelanggan')!,
        nomorSIM: mapValueOfType<String>(json, r'nomorSIM'),
      );
    }
    return null;
  }

  static List<PostPelangganDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostPelangganDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostPelangganDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostPelangganDTO> mapFromJson(dynamic json) {
    final map = <String, PostPelangganDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostPelangganDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostPelangganDTO-objects as value to a dart map
  static Map<String, List<PostPelangganDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostPelangganDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostPelangganDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'idPelanggan',
  };
}

