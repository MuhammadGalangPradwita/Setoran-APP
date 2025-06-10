//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StatusMotor {
  /// Instantiate a new enum with the provided [value].
  const StatusMotor._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const diajukan = StatusMotor._(r'Diajukan');
  static const tersedia = StatusMotor._(r'Tersedia');
  static const disewa = StatusMotor._(r'Disewa');
  static const dalamPerbaikan = StatusMotor._(r'DalamPerbaikan');
  static const tidakTersedia = StatusMotor._(r'TidakTersedia');

  /// List of all possible values in this [enum][StatusMotor].
  static const values = <StatusMotor>[
    diajukan,
    tersedia,
    disewa,
    dalamPerbaikan,
    tidakTersedia,
  ];

  static StatusMotor? fromJson(dynamic value) => StatusMotorTypeTransformer().decode(value);

  static List<StatusMotor> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusMotor>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusMotor.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusMotor] to String,
/// and [decode] dynamic data back to [StatusMotor].
class StatusMotorTypeTransformer {
  factory StatusMotorTypeTransformer() => _instance ??= const StatusMotorTypeTransformer._();

  const StatusMotorTypeTransformer._();

  String encode(StatusMotor data) => data.value;

  /// Decodes a [dynamic value][data] to a StatusMotor.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusMotor? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Diajukan': return StatusMotor.diajukan;
        case r'Tersedia': return StatusMotor.tersedia;
        case r'Disewa': return StatusMotor.disewa;
        case r'DalamPerbaikan': return StatusMotor.dalamPerbaikan;
        case r'TidakTersedia': return StatusMotor.tidakTersedia;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [StatusMotorTypeTransformer] instance.
  static StatusMotorTypeTransformer? _instance;
}

