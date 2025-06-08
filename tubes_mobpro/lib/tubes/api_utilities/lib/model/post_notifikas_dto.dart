//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostNotifikasDTO {
  /// Returns a new [PostNotifikasDTO] instance.
  PostNotifikasDTO({
    this.idPengguna,
    this.judul,
    this.deskripsi,
    this.navigasi,
    this.dataNavigasi = const {},
    this.isRead = false,
  });

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

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostNotifikasDTO &&
    other.idPengguna == idPengguna &&
    other.judul == judul &&
    other.deskripsi == deskripsi &&
    other.navigasi == navigasi &&
    _deepEquality.equals(other.dataNavigasi, dataNavigasi) &&
    other.isRead == isRead;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idPengguna == null ? 0 : idPengguna!.hashCode) +
    (judul == null ? 0 : judul!.hashCode) +
    (deskripsi == null ? 0 : deskripsi!.hashCode) +
    (navigasi == null ? 0 : navigasi!.hashCode) +
    (dataNavigasi == null ? 0 : dataNavigasi!.hashCode) +
    (isRead.hashCode);

  @override
  String toString() => 'PostNotifikasDTO[idPengguna=$idPengguna, judul=$judul, deskripsi=$deskripsi, navigasi=$navigasi, dataNavigasi=$dataNavigasi, isRead=$isRead]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    return json;
  }

  /// Returns a new [PostNotifikasDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostNotifikasDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PostNotifikasDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PostNotifikasDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PostNotifikasDTO(
        idPengguna: mapValueOfType<String>(json, r'idPengguna'),
        judul: mapValueOfType<String>(json, r'judul'),
        deskripsi: mapValueOfType<String>(json, r'deskripsi'),
        navigasi: TargetNavigasi.fromJson(json[r'navigasi']),
        dataNavigasi: mapCastOfType<String, String>(json, r'dataNavigasi') ?? const {},
        isRead: mapValueOfType<bool>(json, r'isRead') ?? false,
      );
    }
    return null;
  }

  static List<PostNotifikasDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostNotifikasDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostNotifikasDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostNotifikasDTO> mapFromJson(dynamic json) {
    final map = <String, PostNotifikasDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostNotifikasDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostNotifikasDTO-objects as value to a dart map
  static Map<String, List<PostNotifikasDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostNotifikasDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostNotifikasDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

