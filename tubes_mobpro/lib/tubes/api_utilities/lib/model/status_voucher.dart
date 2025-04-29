//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StatusVoucher {
  /// Instantiate a new enum with the provided [value].
  const StatusVoucher._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const aktif = StatusVoucher._(r'Aktif');
  static const nonAktif = StatusVoucher._(r'NonAktif');

  /// List of all possible values in this [enum][StatusVoucher].
  static const values = <StatusVoucher>[
    aktif,
    nonAktif,
  ];

  static StatusVoucher? fromJson(dynamic value) => StatusVoucherTypeTransformer().decode(value);

  static List<StatusVoucher> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusVoucher>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusVoucher.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusVoucher] to String,
/// and [decode] dynamic data back to [StatusVoucher].
class StatusVoucherTypeTransformer {
  factory StatusVoucherTypeTransformer() => _instance ??= const StatusVoucherTypeTransformer._();

  const StatusVoucherTypeTransformer._();

  String encode(StatusVoucher data) => data.value;

  /// Decodes a [dynamic value][data] to a StatusVoucher.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusVoucher? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Aktif': return StatusVoucher.aktif;
        case r'NonAktif': return StatusVoucher.nonAktif;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [StatusVoucherTypeTransformer] instance.
  static StatusVoucherTypeTransformer? _instance;
}

