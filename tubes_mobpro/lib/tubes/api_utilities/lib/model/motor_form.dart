//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MotorForm {
  /// Returns a new [MotorForm] instance.
  MotorForm({
    required this.platNomor,
    required this.idMitra,
    required this.nomorSTNK,
    required this.nomorBPKB,
    required this.model,
    required this.brand,
    required this.tipe,
    required this.tahun,
    required this.transmisi,
    required this.statusMotor,
    required this.hargaHarian,
  });

  String platNomor;

  int idMitra;

  String nomorSTNK;

  String nomorBPKB;

  String model;

  String brand;

  String tipe;

  int tahun;

  String transmisi;

  String statusMotor;

  double hargaHarian;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MotorForm &&
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
    other.hargaHarian == hargaHarian;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (platNomor.hashCode) +
    (idMitra.hashCode) +
    (nomorSTNK.hashCode) +
    (nomorBPKB.hashCode) +
    (model.hashCode) +
    (brand.hashCode) +
    (tipe.hashCode) +
    (tahun.hashCode) +
    (transmisi.hashCode) +
    (statusMotor.hashCode) +
    (hargaHarian.hashCode);

  @override
  String toString() => 'MotorForm[platNomor=$platNomor, idMitra=$idMitra, nomorSTNK=$nomorSTNK, nomorBPKB=$nomorBPKB, model=$model, brand=$brand, tipe=$tipe, tahun=$tahun, transmisi=$transmisi, statusMotor=$statusMotor, hargaHarian=$hargaHarian]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'platNomor'] = this.platNomor;
      json[r'idMitra'] = this.idMitra;
      json[r'nomorSTNK'] = this.nomorSTNK;
      json[r'nomorBPKB'] = this.nomorBPKB;
      json[r'model'] = this.model;
      json[r'brand'] = this.brand;
      json[r'tipe'] = this.tipe;
      json[r'tahun'] = this.tahun;
      json[r'transmisi'] = this.transmisi;
      json[r'statusMotor'] = this.statusMotor;
      json[r'hargaHarian'] = this.hargaHarian;
    return json;
  }

  /// Returns a new [MotorForm] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MotorForm? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MotorForm[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MotorForm[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MotorForm(
        platNomor: mapValueOfType<String>(json, r'platNomor')!,
        idMitra: mapValueOfType<int>(json, r'idMitra')!,
        nomorSTNK: mapValueOfType<String>(json, r'nomorSTNK')!,
        nomorBPKB: mapValueOfType<String>(json, r'nomorBPKB')!,
        model: mapValueOfType<String>(json, r'model')!,
        brand: mapValueOfType<String>(json, r'brand')!,
        tipe: mapValueOfType<String>(json, r'tipe')!,
        tahun: mapValueOfType<int>(json, r'tahun')!,
        transmisi: mapValueOfType<String>(json, r'transmisi')!,
        statusMotor: mapValueOfType<String>(json, r'statusMotor')!,
        hargaHarian: mapValueOfType<double>(json, r'hargaHarian')!,
      );
    }
    return null;
  }

  static List<MotorForm> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MotorForm>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MotorForm.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MotorForm> mapFromJson(dynamic json) {
    final map = <String, MotorForm>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MotorForm.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MotorForm-objects as value to a dart map
  static Map<String, List<MotorForm>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MotorForm>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MotorForm.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'platNomor',
    'idMitra',
    'nomorSTNK',
    'nomorBPKB',
    'model',
    'brand',
    'tipe',
    'tahun',
    'transmisi',
    'statusMotor',
    'hargaHarian',
  };
}

