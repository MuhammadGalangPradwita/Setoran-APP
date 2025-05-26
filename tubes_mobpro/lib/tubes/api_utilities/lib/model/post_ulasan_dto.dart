//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostUlasanDTO {
  /// Returns a new [PostUlasanDTO] instance.
  PostUlasanDTO({
    required this.idMotor,
    required this.idPelanggan,
    required this.rating,
    required this.komentar,
  });

  int idMotor;

  int idPelanggan;

  /// Minimum value: 1
  /// Maximum value: 5
  int rating;

  String komentar;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostUlasanDTO &&
    other.idMotor == idMotor &&
    other.idPelanggan == idPelanggan &&
    other.rating == rating &&
    other.komentar == komentar;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idMotor.hashCode) +
    (idPelanggan.hashCode) +
    (rating.hashCode) +
    (komentar.hashCode);

  @override
  String toString() => 'PostUlasanDTO[idMotor=$idMotor, idPelanggan=$idPelanggan, rating=$rating, komentar=$komentar]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'idMotor'] = this.idMotor;
      json[r'idPelanggan'] = this.idPelanggan;
      json[r'rating'] = this.rating;
      json[r'komentar'] = this.komentar;
    return json;
  }

  /// Returns a new [PostUlasanDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostUlasanDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PostUlasanDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PostUlasanDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PostUlasanDTO(
        idMotor: mapValueOfType<int>(json, r'idMotor')!,
        idPelanggan: mapValueOfType<int>(json, r'idPelanggan')!,
        rating: mapValueOfType<int>(json, r'rating')!,
        komentar: mapValueOfType<String>(json, r'komentar')!,
      );
    }
    return null;
  }

  static List<PostUlasanDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostUlasanDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostUlasanDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostUlasanDTO> mapFromJson(dynamic json) {
    final map = <String, PostUlasanDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostUlasanDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostUlasanDTO-objects as value to a dart map
  static Map<String, List<PostUlasanDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostUlasanDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostUlasanDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'idMotor',
    'idPelanggan',
    'rating',
    'komentar',
  };
}

