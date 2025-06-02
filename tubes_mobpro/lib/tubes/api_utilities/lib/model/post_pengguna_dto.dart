//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostPenggunaDTO {
  /// Returns a new [PostPenggunaDTO] instance.
  PostPenggunaDTO({
    required this.id,
    this.nama,
    this.tanggalLahir,
    this.nomorTelepon,
    this.umur,
    this.nomorKTP,
    this.alamat,
    this.idGambar,
    this.isAdmin,
  });

  String id;

  String? nama;

  DateTime? tanggalLahir;

  String? nomorTelepon;

  int? umur;

  String? nomorKTP;

  String? alamat;

  String? idGambar;

  bool? isAdmin;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostPenggunaDTO &&
    other.id == id &&
    other.nama == nama &&
    other.tanggalLahir == tanggalLahir &&
    other.nomorTelepon == nomorTelepon &&
    other.umur == umur &&
    other.nomorKTP == nomorKTP &&
    other.alamat == alamat &&
    other.idGambar == idGambar &&
    other.isAdmin == isAdmin;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (nama == null ? 0 : nama!.hashCode) +
    (tanggalLahir == null ? 0 : tanggalLahir!.hashCode) +
    (nomorTelepon == null ? 0 : nomorTelepon!.hashCode) +
    (umur == null ? 0 : umur!.hashCode) +
    (nomorKTP == null ? 0 : nomorKTP!.hashCode) +
    (alamat == null ? 0 : alamat!.hashCode) +
    (idGambar == null ? 0 : idGambar!.hashCode) +
    (isAdmin == null ? 0 : isAdmin!.hashCode);

  @override
  String toString() => 'PostPenggunaDTO[id=$id, nama=$nama, tanggalLahir=$tanggalLahir, nomorTelepon=$nomorTelepon, umur=$umur, nomorKTP=$nomorKTP, alamat=$alamat, idGambar=$idGambar, isAdmin=$isAdmin]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
    if (this.nama != null) {
      json[r'nama'] = this.nama;
    } else {
      json[r'nama'] = null;
    }
    if (this.tanggalLahir != null) {
      json[r'tanggalLahir'] = this.tanggalLahir!.toUtc().toIso8601String();
    } else {
      json[r'tanggalLahir'] = null;
    }
    if (this.nomorTelepon != null) {
      json[r'nomorTelepon'] = this.nomorTelepon;
    } else {
      json[r'nomorTelepon'] = null;
    }
    if (this.umur != null) {
      json[r'umur'] = this.umur;
    } else {
      json[r'umur'] = null;
    }
    if (this.nomorKTP != null) {
      json[r'nomorKTP'] = this.nomorKTP;
    } else {
      json[r'nomorKTP'] = null;
    }
    if (this.alamat != null) {
      json[r'alamat'] = this.alamat;
    } else {
      json[r'alamat'] = null;
    }
    if (this.idGambar != null) {
      json[r'idGambar'] = this.idGambar;
    } else {
      json[r'idGambar'] = null;
    }
    if (this.isAdmin != null) {
      json[r'isAdmin'] = this.isAdmin;
    } else {
      json[r'isAdmin'] = null;
    }
    return json;
  }

  /// Returns a new [PostPenggunaDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostPenggunaDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PostPenggunaDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PostPenggunaDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PostPenggunaDTO(
        id: mapValueOfType<String>(json, r'id')!,
        nama: mapValueOfType<String>(json, r'nama'),
        tanggalLahir: mapDateTime(json, r'tanggalLahir', r''),
        nomorTelepon: mapValueOfType<String>(json, r'nomorTelepon'),
        umur: mapValueOfType<int>(json, r'umur'),
        nomorKTP: mapValueOfType<String>(json, r'nomorKTP'),
        alamat: mapValueOfType<String>(json, r'alamat'),
        idGambar: mapValueOfType<String>(json, r'idGambar'),
        isAdmin: mapValueOfType<bool>(json, r'isAdmin'),
      );
    }
    return null;
  }

  static List<PostPenggunaDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostPenggunaDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostPenggunaDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostPenggunaDTO> mapFromJson(dynamic json) {
    final map = <String, PostPenggunaDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostPenggunaDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostPenggunaDTO-objects as value to a dart map
  static Map<String, List<PostPenggunaDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostPenggunaDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostPenggunaDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
  };
}

