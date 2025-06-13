//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StatusDiskon {
  /// Instantiate a new enum with the provided [value].
  const StatusDiskon._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const aktif = StatusDiskon._(r'Aktif');
  static const nonAktif = StatusDiskon._(r'NonAktif');

  /// List of all possible values in this [enum][StatusDiskon].
  static const values = <StatusDiskon>[
    aktif,
    nonAktif,
  ];

  static StatusDiskon? fromJson(dynamic value) => StatusDiskonTypeTransformer().decode(value);

  static List<StatusDiskon> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusDiskon>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusDiskon.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusDiskon] to String,
/// and [decode] dynamic data back to [StatusDiskon].
class StatusDiskonTypeTransformer {
  factory StatusDiskonTypeTransformer() => _instance ??= const StatusDiskonTypeTransformer._();

  const StatusDiskonTypeTransformer._();

  String encode(StatusDiskon data) => data.value;

  /// Decodes a [dynamic value][data] to a StatusDiskon.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusDiskon? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Aktif': return StatusDiskon.aktif;
        case r'NonAktif': return StatusDiskon.nonAktif;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [StatusDiskonTypeTransformer] instance.
  static StatusDiskonTypeTransformer? _instance;
}

