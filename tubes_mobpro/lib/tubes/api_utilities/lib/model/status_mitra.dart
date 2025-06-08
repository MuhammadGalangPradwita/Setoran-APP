//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StatusMitra {
  /// Instantiate a new enum with the provided [value].
  const StatusMitra._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const aktif = StatusMitra._(r'Aktif');
  static const nonAktif = StatusMitra._(r'NonAktif');

  /// List of all possible values in this [enum][StatusMitra].
  static const values = <StatusMitra>[
    aktif,
    nonAktif,
  ];

  static StatusMitra? fromJson(dynamic value) => StatusMitraTypeTransformer().decode(value);

  static List<StatusMitra> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusMitra>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusMitra.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusMitra] to String,
/// and [decode] dynamic data back to [StatusMitra].
class StatusMitraTypeTransformer {
  factory StatusMitraTypeTransformer() => _instance ??= const StatusMitraTypeTransformer._();

  const StatusMitraTypeTransformer._();

  String encode(StatusMitra data) => data.value;

  /// Decodes a [dynamic value][data] to a StatusMitra.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusMitra? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Aktif': return StatusMitra.aktif;
        case r'NonAktif': return StatusMitra.nonAktif;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [StatusMitraTypeTransformer] instance.
  static StatusMitraTypeTransformer? _instance;
}

