//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Motor {
  /// Returns a new [Motor] instance.
  Motor({
    this.idMotor,
    this.platNomor,
    this.idMitra,
    this.nomorSTNK,
    this.nomorBPKB,
    this.model,
    this.brand,
    this.tipe,
    this.tahun,
    this.transmisi,
    this.statusMotor,
    this.hargaHarian,
    this.diskon = const [],
    this.idMotorImage,
    this.mitra,
    this.motorImage,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idMotor;

  String? platNomor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idMitra;

  String? nomorSTNK;

  String? nomorBPKB;

  String? model;

  String? brand;

  String? tipe;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? tahun;

  String? transmisi;

  String? statusMotor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? hargaHarian;

  List<Diskon>? diskon;

  int? idMotorImage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Mitra? mitra;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  MotorImage? motorImage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Motor &&
    other.idMotor == idMotor &&
    other.platNomor == platNomor &&
    other.idMitra == idMitra &&
    other.nomorSTNK == nomorSTNK &&
    other.nomorBPKB == nomorBPKB &&
    other.model == model &&
    other.brand == brand &&
    other.tipe == tipe &&
    other.tahun == tahun &&
    other.transmisi == transmisi &&
    other.statusMotor == statusMotor &&
    other.hargaHarian == hargaHarian &&
    _deepEquality.equals(other.diskon, diskon) &&
    other.idMotorImage == idMotorImage &&
    other.mitra == mitra &&
    other.motorImage == motorImage;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idMotor == null ? 0 : idMotor!.hashCode) +
    (platNomor == null ? 0 : platNomor!.hashCode) +
    (idMitra == null ? 0 : idMitra!.hashCode) +
    (nomorSTNK == null ? 0 : nomorSTNK!.hashCode) +
    (nomorBPKB == null ? 0 : nomorBPKB!.hashCode) +
    (model == null ? 0 : model!.hashCode) +
    (brand == null ? 0 : brand!.hashCode) +
    (tipe == null ? 0 : tipe!.hashCode) +
    (tahun == null ? 0 : tahun!.hashCode) +
    (transmisi == null ? 0 : transmisi!.hashCode) +
    (statusMotor == null ? 0 : statusMotor!.hashCode) +
    (hargaHarian == null ? 0 : hargaHarian!.hashCode) +
    (diskon == null ? 0 : diskon!.hashCode) +
    (idMotorImage == null ? 0 : idMotorImage!.hashCode) +
    (mitra == null ? 0 : mitra!.hashCode) +
    (motorImage == null ? 0 : motorImage!.hashCode);

  @override
  String toString() => 'Motor[idMotor=$idMotor, platNomor=$platNomor, idMitra=$idMitra, nomorSTNK=$nomorSTNK, nomorBPKB=$nomorBPKB, model=$model, brand=$brand, tipe=$tipe, tahun=$tahun, transmisi=$transmisi, statusMotor=$statusMotor, hargaHarian=$hargaHarian, diskon=$diskon, idMotorImage=$idMotorImage, mitra=$mitra, motorImage=$motorImage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.idMotor != null) {
      json[r'idMotor'] = this.idMotor;
    } else {
      json[r'idMotor'] = null;
    }
    if (this.platNomor != null) {
      json[r'platNomor'] = this.platNomor;
    } else {
      json[r'platNomor'] = null;
    }
    if (this.idMitra != null) {
      json[r'idMitra'] = this.idMitra;
    } else {
      json[r'idMitra'] = null;
    }
    if (this.nomorSTNK != null) {
      json[r'nomorSTNK'] = this.nomorSTNK;
    } else {
      json[r'nomorSTNK'] = null;
    }
    if (this.nomorBPKB != null) {
      json[r'nomorBPKB'] = this.nomorBPKB;
    } else {
      json[r'nomorBPKB'] = null;
    }
    if (this.model != null) {
      json[r'model'] = this.model;
    } else {
      json[r'model'] = null;
    }
    if (this.brand != null) {
      json[r'brand'] = this.brand;
    } else {
      json[r'brand'] = null;
    }
    if (this.tipe != null) {
      json[r'tipe'] = this.tipe;
    } else {
      json[r'tipe'] = null;
    }
    if (this.tahun != null) {
      json[r'tahun'] = this.tahun;
    } else {
      json[r'tahun'] = null;
    }
    if (this.transmisi != null) {
      json[r'transmisi'] = this.transmisi;
    } else {
      json[r'transmisi'] = null;
    }
    if (this.statusMotor != null) {
      json[r'statusMotor'] = this.statusMotor;
    } else {
      json[r'statusMotor'] = null;
    }
    if (this.hargaHarian != null) {
      json[r'hargaHarian'] = this.hargaHarian;
    } else {
      json[r'hargaHarian'] = null;
    }
    if (this.diskon != null) {
      json[r'diskon'] = this.diskon;
    } else {
      json[r'diskon'] = null;
    }
    if (this.idMotorImage != null) {
      json[r'idMotorImage'] = this.idMotorImage;
    } else {
      json[r'idMotorImage'] = null;
    }
    if (this.mitra != null) {
      json[r'mitra'] = this.mitra;
    } else {
      json[r'mitra'] = null;
    }
    if (this.motorImage != null) {
      json[r'motorImage'] = this.motorImage;
    } else {
      json[r'motorImage'] = null;
    }
    return json;
  }

  /// Returns a new [Motor] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Motor? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Motor[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Motor[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Motor(
        idMotor: mapValueOfType<int>(json, r'idMotor'),
        platNomor: mapValueOfType<String>(json, r'platNomor'),
        idMitra: mapValueOfType<int>(json, r'idMitra'),
        nomorSTNK: mapValueOfType<String>(json, r'nomorSTNK'),
        nomorBPKB: mapValueOfType<String>(json, r'nomorBPKB'),
        model: mapValueOfType<String>(json, r'model'),
        brand: mapValueOfType<String>(json, r'brand'),
        tipe: mapValueOfType<String>(json, r'tipe'),
        tahun: mapValueOfType<int>(json, r'tahun'),
        transmisi: mapValueOfType<String>(json, r'transmisi'),
        statusMotor: mapValueOfType<String>(json, r'statusMotor'),
        hargaHarian: mapValueOfType<double>(json, r'hargaHarian'),
        diskon: Diskon.listFromJson(json[r'diskon']),
        idMotorImage: mapValueOfType<int>(json, r'idMotorImage'),
        mitra: Mitra.fromJson(json[r'mitra']),
        motorImage: MotorImage.fromJson(json[r'motorImage']),
      );
    }
    return null;
  }

  static List<Motor> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Motor>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Motor.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Motor> mapFromJson(dynamic json) {
    final map = <String, Motor>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Motor.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Motor-objects as value to a dart map
  static Map<String, List<Motor>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Motor>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Motor.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

