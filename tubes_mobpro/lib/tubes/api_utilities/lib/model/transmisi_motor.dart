//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TransmisiMotor {
  /// Instantiate a new enum with the provided [value].
  const TransmisiMotor._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const matic = TransmisiMotor._(r'Matic');
  static const manual = TransmisiMotor._(r'Manual');

  /// List of all possible values in this [enum][TransmisiMotor].
  static const values = <TransmisiMotor>[
    matic,
    manual,
  ];

  static TransmisiMotor? fromJson(dynamic value) => TransmisiMotorTypeTransformer().decode(value);

  static List<TransmisiMotor> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TransmisiMotor>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TransmisiMotor.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TransmisiMotor] to String,
/// and [decode] dynamic data back to [TransmisiMotor].
class TransmisiMotorTypeTransformer {
  factory TransmisiMotorTypeTransformer() => _instance ??= const TransmisiMotorTypeTransformer._();

  const TransmisiMotorTypeTransformer._();

  String encode(TransmisiMotor data) => data.value;

  /// Decodes a [dynamic value][data] to a TransmisiMotor.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TransmisiMotor? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Matic': return TransmisiMotor.matic;
        case r'Manual': return TransmisiMotor.manual;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TransmisiMotorTypeTransformer] instance.
  static TransmisiMotorTypeTransformer? _instance;
}

