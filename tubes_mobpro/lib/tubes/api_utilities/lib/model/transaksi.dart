//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Transaksi {
  /// Returns a new [Transaksi] instance.
  Transaksi({
    this.idTransaksi,
    this.idMotor,
    this.idPelanggan,
    this.tanggalMulai,
    this.tanggalSelesai,
    this.totalHarga,
    this.status,
    this.motor,
    this.pelanggan,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idTransaksi;

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
  DateTime? tanggalMulai;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? tanggalSelesai;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? totalHarga;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  StatusTransaksi? status;

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
  bool operator ==(Object other) => identical(this, other) || other is Transaksi &&
    other.idTransaksi == idTransaksi &&
    other.idMotor == idMotor &&
    other.idPelanggan == idPelanggan &&
    other.tanggalMulai == tanggalMulai &&
    other.tanggalSelesai == tanggalSelesai &&
    other.totalHarga == totalHarga &&
    other.status == status &&
    other.motor == motor &&
    other.pelanggan == pelanggan;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (idTransaksi == null ? 0 : idTransaksi!.hashCode) +
    (idMotor == null ? 0 : idMotor!.hashCode) +
    (idPelanggan == null ? 0 : idPelanggan!.hashCode) +
    (tanggalMulai == null ? 0 : tanggalMulai!.hashCode) +
    (tanggalSelesai == null ? 0 : tanggalSelesai!.hashCode) +
    (totalHarga == null ? 0 : totalHarga!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (motor == null ? 0 : motor!.hashCode) +
    (pelanggan == null ? 0 : pelanggan!.hashCode);

  @override
  String toString() => 'Transaksi[idTransaksi=$idTransaksi, idMotor=$idMotor, idPelanggan=$idPelanggan, tanggalMulai=$tanggalMulai, tanggalSelesai=$tanggalSelesai, totalHarga=$totalHarga, status=$status, motor=$motor, pelanggan=$pelanggan]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.idTransaksi != null) {
      json[r'idTransaksi'] = this.idTransaksi;
    } else {
      json[r'idTransaksi'] = null;
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
    if (this.tanggalMulai != null) {
      json[r'tanggalMulai'] = this.tanggalMulai!.toUtc().toIso8601String();
    } else {
      json[r'tanggalMulai'] = null;
    }
    if (this.tanggalSelesai != null) {
      json[r'tanggalSelesai'] = this.tanggalSelesai!.toUtc().toIso8601String();
    } else {
      json[r'tanggalSelesai'] = null;
    }
    if (this.totalHarga != null) {
      json[r'totalHarga'] = this.totalHarga;
    } else {
      json[r'totalHarga'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
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

  /// Returns a new [Transaksi] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Transaksi? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Transaksi[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Transaksi[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Transaksi(
        idTransaksi: mapValueOfType<int>(json, r'idTransaksi'),
        idMotor: mapValueOfType<int>(json, r'idMotor'),
        idPelanggan: mapValueOfType<int>(json, r'idPelanggan'),
        tanggalMulai: mapDateTime(json, r'tanggalMulai', r''),
        tanggalSelesai: mapDateTime(json, r'tanggalSelesai', r''),
        totalHarga: mapValueOfType<double>(json, r'totalHarga'),
        status: StatusTransaksi.fromJson(json[r'status']),
        motor: Motor.fromJson(json[r'motor']),
        pelanggan: Pelanggan.fromJson(json[r'pelanggan']),
      );
    }
    return null;
  }

  static List<Transaksi> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Transaksi>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Transaksi.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Transaksi> mapFromJson(dynamic json) {
    final map = <String, Transaksi>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Transaksi.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Transaksi-objects as value to a dart map
  static Map<String, List<Transaksi>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Transaksi>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Transaksi.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

