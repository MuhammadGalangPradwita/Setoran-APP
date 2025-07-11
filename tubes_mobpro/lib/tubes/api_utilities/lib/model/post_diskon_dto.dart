//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostDiskonDTO {
  /// Returns a new [PostDiskonDTO] instance.
  PostDiskonDTO({
    this.idMotor,
    this.nama,
    this.deskripsi,
    this.jumlahDiskon,
    this.statusDiskon,
    this.tanggalMulai,
    this.tanggalAkhir,
  });

  int? idMotor;

  String? nama;

  String? deskripsi;

  double? jumlahDiskon;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  StatusDiskon? statusDiskon;

  DateTime? tanggalMulai;

  DateTime? tanggalAkhir;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostDiskonDTO &&
    other.idMotor == idMotor &&
    other.nama == nama &&
    other.deskripsi == deskripsi &&
    other.jumlahDiskon == jumlahDiskon &&
    other.statusDiskon == statusDiskon &&
    other.tanggalMulai == tanggalMulai &&
    other.tanggalAkhir == tanggalAkhir;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idMotor == null ? 0 : idMotor!.hashCode) +
    (nama == null ? 0 : nama!.hashCode) +
    (deskripsi == null ? 0 : deskripsi!.hashCode) +
    (jumlahDiskon == null ? 0 : jumlahDiskon!.hashCode) +
    (statusDiskon == null ? 0 : statusDiskon!.hashCode) +
    (tanggalMulai == null ? 0 : tanggalMulai!.hashCode) +
    (tanggalAkhir == null ? 0 : tanggalAkhir!.hashCode);

  @override
  String toString() => 'PostDiskonDTO[idMotor=$idMotor, nama=$nama, deskripsi=$deskripsi, jumlahDiskon=$jumlahDiskon, statusDiskon=$statusDiskon, tanggalMulai=$tanggalMulai, tanggalAkhir=$tanggalAkhir]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.idMotor != null) {
      json[r'idMotor'] = this.idMotor;
    } else {
      json[r'idMotor'] = null;
    }
    if (this.nama != null) {
      json[r'nama'] = this.nama;
    } else {
      json[r'nama'] = null;
    }
    if (this.deskripsi != null) {
      json[r'deskripsi'] = this.deskripsi;
    } else {
      json[r'deskripsi'] = null;
    }
    if (this.jumlahDiskon != null) {
      json[r'jumlahDiskon'] = this.jumlahDiskon;
    } else {
      json[r'jumlahDiskon'] = null;
    }
    if (this.statusDiskon != null) {
      json[r'statusDiskon'] = this.statusDiskon;
    } else {
      json[r'statusDiskon'] = null;
    }
    if (this.tanggalMulai != null) {
      json[r'tanggalMulai'] = this.tanggalMulai!.toUtc().toIso8601String();
    } else {
      json[r'tanggalMulai'] = null;
    }
    if (this.tanggalAkhir != null) {
      json[r'tanggalAkhir'] = this.tanggalAkhir!.toUtc().toIso8601String();
    } else {
      json[r'tanggalAkhir'] = null;
    }
    return json;
  }

  /// Returns a new [PostDiskonDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostDiskonDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PostDiskonDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PostDiskonDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PostDiskonDTO(
        idMotor: mapValueOfType<int>(json, r'idMotor'),
        nama: mapValueOfType<String>(json, r'nama'),
        deskripsi: mapValueOfType<String>(json, r'deskripsi'),
        jumlahDiskon: mapValueOfType<double>(json, r'jumlahDiskon'),
        statusDiskon: StatusDiskon.fromJson(json[r'statusDiskon']),
        tanggalMulai: mapDateTime(json, r'tanggalMulai', r''),
        tanggalAkhir: mapDateTime(json, r'tanggalAkhir', r''),
      );
    }
    return null;
  }

  static List<PostDiskonDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostDiskonDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostDiskonDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostDiskonDTO> mapFromJson(dynamic json) {
    final map = <String, PostDiskonDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostDiskonDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostDiskonDTO-objects as value to a dart map
  static Map<String, List<PostDiskonDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostDiskonDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostDiskonDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

