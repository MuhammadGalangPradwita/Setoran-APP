//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StatusTransaksi {
  /// Instantiate a new enum with the provided [value].
  const StatusTransaksi._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const dibuat = StatusTransaksi._(r'Dibuat');
  static const berlangsung = StatusTransaksi._(r'Berlangsung');
  static const batal = StatusTransaksi._(r'Batal');
  static const selesai = StatusTransaksi._(r'Selesai');

  /// List of all possible values in this [enum][StatusTransaksi].
  static const values = <StatusTransaksi>[
    dibuat,
    berlangsung,
    batal,
    selesai,
  ];

  static StatusTransaksi? fromJson(dynamic value) => StatusTransaksiTypeTransformer().decode(value);

  static List<StatusTransaksi> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusTransaksi>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusTransaksi.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusTransaksi] to String,
/// and [decode] dynamic data back to [StatusTransaksi].
class StatusTransaksiTypeTransformer {
  factory StatusTransaksiTypeTransformer() => _instance ??= const StatusTransaksiTypeTransformer._();

  const StatusTransaksiTypeTransformer._();

  String encode(StatusTransaksi data) => data.value;

  /// Decodes a [dynamic value][data] to a StatusTransaksi.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusTransaksi? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Dibuat': return StatusTransaksi.dibuat;
        case r'Berlangsung': return StatusTransaksi.berlangsung;
        case r'Batal': return StatusTransaksi.batal;
        case r'Selesai': return StatusTransaksi.selesai;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [StatusTransaksiTypeTransformer] instance.
  static StatusTransaksiTypeTransformer? _instance;
}

