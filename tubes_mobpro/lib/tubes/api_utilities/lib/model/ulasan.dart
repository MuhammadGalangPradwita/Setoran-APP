//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Ulasan {
  /// Returns a new [Ulasan] instance.
  Ulasan({
    this.idUlasan,
    this.idMotor,
    this.idPelanggan,
    this.rating,
    this.komentar,
    this.tanggalUlasan,
    this.motor,
    this.pelanggan,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idUlasan;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idMotor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idPelanggan;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? rating;

  String? komentar;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? tanggalUlasan;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Motor? motor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Pelanggan? pelanggan;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Ulasan &&
    other.idUlasan == idUlasan &&
    other.idMotor == idMotor &&
    other.idPelanggan == idPelanggan &&
    other.rating == rating &&
    other.komentar == komentar &&
    other.tanggalUlasan == tanggalUlasan &&
    other.motor == motor &&
    other.pelanggan == pelanggan;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idUlasan == null ? 0 : idUlasan!.hashCode) +
    (idMotor == null ? 0 : idMotor!.hashCode) +
    (idPelanggan == null ? 0 : idPelanggan!.hashCode) +
    (rating == null ? 0 : rating!.hashCode) +
    (komentar == null ? 0 : komentar!.hashCode) +
    (tanggalUlasan == null ? 0 : tanggalUlasan!.hashCode) +
    (motor == null ? 0 : motor!.hashCode) +
    (pelanggan == null ? 0 : pelanggan!.hashCode);

  @override
  String toString() => 'Ulasan[idUlasan=$idUlasan, idMotor=$idMotor, idPelanggan=$idPelanggan, rating=$rating, komentar=$komentar, tanggalUlasan=$tanggalUlasan, motor=$motor, pelanggan=$pelanggan]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.idUlasan != null) {
      json[r'idUlasan'] = this.idUlasan;
    } else {
      json[r'idUlasan'] = null;
    }
    if (this.idMotor != null) {
      json[r'idMotor'] = this.idMotor;
    } else {
      json[r'idMotor'] = null;
    }
    if (this.idPelanggan != null) {
      json[r'idPelanggan'] = this.idPelanggan;
    } else {
      json[r'idPelanggan'] = null;
    }
    if (this.rating != null) {
      json[r'rating'] = this.rating;
    } else {
      json[r'rating'] = null;
    }
    if (this.komentar != null) {
      json[r'komentar'] = this.komentar;
    } else {
      json[r'komentar'] = null;
    }
    if (this.tanggalUlasan != null) {
      json[r'tanggalUlasan'] = this.tanggalUlasan!.toUtc().toIso8601String();
    } else {
      json[r'tanggalUlasan'] = null;
    }
    if (this.motor != null) {
      json[r'motor'] = this.motor;
    } else {
      json[r'motor'] = null;
    }
    if (this.pelanggan != null) {
      json[r'pelanggan'] = this.pelanggan;
    } else {
      json[r'pelanggan'] = null;
    }
    return json;
  }

  /// Returns a new [Ulasan] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Ulasan? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Ulasan[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Ulasan[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Ulasan(
        idUlasan: mapValueOfType<int>(json, r'idUlasan'),
        idMotor: mapValueOfType<int>(json, r'idMotor'),
        idPelanggan: mapValueOfType<int>(json, r'idPelanggan'),
        rating: mapValueOfType<int>(json, r'rating'),
        komentar: mapValueOfType<String>(json, r'komentar'),
        tanggalUlasan: mapDateTime(json, r'tanggalUlasan', r''),
        motor: Motor.fromJson(json[r'motor']),
        pelanggan: Pelanggan.fromJson(json[r'pelanggan']),
      );
    }
    return null;
  }

  static List<Ulasan> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Ulasan>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Ulasan.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Ulasan> mapFromJson(dynamic json) {
    final map = <String, Ulasan>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Ulasan.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Ulasan-objects as value to a dart map
  static Map<String, List<Ulasan>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Ulasan>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Ulasan.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

