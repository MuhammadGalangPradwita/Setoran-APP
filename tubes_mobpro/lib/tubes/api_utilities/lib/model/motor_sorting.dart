//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MotorSorting {
  /// Instantiate a new enum with the provided [value].
  const MotorSorting._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const none = MotorSorting._(r'None');
  static const mostPopular = MotorSorting._(r'MostPopular');
  static const bestDiscount = MotorSorting._(r'BestDiscount');
  static const bestRating = MotorSorting._(r'BestRating');

  /// List of all possible values in this [enum][MotorSorting].
  static const values = <MotorSorting>[
    none,
    mostPopular,
    bestDiscount,
    bestRating,
  ];

  static MotorSorting? fromJson(dynamic value) => MotorSortingTypeTransformer().decode(value);

  static List<MotorSorting> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MotorSorting>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MotorSorting.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MotorSorting] to String,
/// and [decode] dynamic data back to [MotorSorting].
class MotorSortingTypeTransformer {
  factory MotorSortingTypeTransformer() => _instance ??= const MotorSortingTypeTransformer._();

  const MotorSortingTypeTransformer._();

  String encode(MotorSorting data) => data.value;

  /// Decodes a [dynamic value][data] to a MotorSorting.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MotorSorting? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'None': return MotorSorting.none;
        case r'MostPopular': return MotorSorting.mostPopular;
        case r'BestDiscount': return MotorSorting.bestDiscount;
        case r'BestRating': return MotorSorting.bestRating;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [MotorSortingTypeTransformer] instance.
  static MotorSortingTypeTransformer? _instance;
}

