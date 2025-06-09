//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DashboardDataDTO {
  /// Returns a new [DashboardDataDTO] instance.
  DashboardDataDTO({
    this.availableMotorCount,
    this.filedMotorCount,
    this.transaksiOngoing,
    this.totalIncome,
    this.chartTransaksi = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? availableMotorCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? filedMotorCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? transaksiOngoing;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? totalIncome;

  List<Transaksi>? chartTransaksi;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DashboardDataDTO &&
    other.availableMotorCount == availableMotorCount &&
    other.filedMotorCount == filedMotorCount &&
    other.transaksiOngoing == transaksiOngoing &&
    other.totalIncome == totalIncome &&
    _deepEquality.equals(other.chartTransaksi, chartTransaksi);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (availableMotorCount == null ? 0 : availableMotorCount!.hashCode) +
    (filedMotorCount == null ? 0 : filedMotorCount!.hashCode) +
    (transaksiOngoing == null ? 0 : transaksiOngoing!.hashCode) +
    (totalIncome == null ? 0 : totalIncome!.hashCode) +
    (chartTransaksi == null ? 0 : chartTransaksi!.hashCode);

  @override
  String toString() => 'DashboardDataDTO[availableMotorCount=$availableMotorCount, filedMotorCount=$filedMotorCount, transaksiOngoing=$transaksiOngoing, totalIncome=$totalIncome, chartTransaksi=$chartTransaksi]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.availableMotorCount != null) {
      json[r'availableMotorCount'] = this.availableMotorCount;
    } else {
      json[r'availableMotorCount'] = null;
    }
    if (this.filedMotorCount != null) {
      json[r'filedMotorCount'] = this.filedMotorCount;
    } else {
      json[r'filedMotorCount'] = null;
    }
    if (this.transaksiOngoing != null) {
      json[r'transaksiOngoing'] = this.transaksiOngoing;
    } else {
      json[r'transaksiOngoing'] = null;
    }
    if (this.totalIncome != null) {
      json[r'totalIncome'] = this.totalIncome;
    } else {
      json[r'totalIncome'] = null;
    }
    if (this.chartTransaksi != null) {
      json[r'chartTransaksi'] = this.chartTransaksi;
    } else {
      json[r'chartTransaksi'] = null;
    }
    return json;
  }

  /// Returns a new [DashboardDataDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DashboardDataDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DashboardDataDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DashboardDataDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DashboardDataDTO(
        availableMotorCount: mapValueOfType<int>(json, r'availableMotorCount'),
        filedMotorCount: mapValueOfType<int>(json, r'filedMotorCount'),
        transaksiOngoing: mapValueOfType<int>(json, r'transaksiOngoing'),
        totalIncome: mapValueOfType<double>(json, r'totalIncome'),
        chartTransaksi: Transaksi.listFromJson(json[r'chartTransaksi']),
      );
    }
    return null;
  }

  static List<DashboardDataDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DashboardDataDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DashboardDataDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DashboardDataDTO> mapFromJson(dynamic json) {
    final map = <String, DashboardDataDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DashboardDataDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DashboardDataDTO-objects as value to a dart map
  static Map<String, List<DashboardDataDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DashboardDataDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DashboardDataDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

