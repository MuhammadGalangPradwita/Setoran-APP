//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StatusPembayaran {
  /// Instantiate a new enum with the provided [value].
  const StatusPembayaran._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const belumLunas = StatusPembayaran._(r'BelumLunas');
  static const menungguKonfirmasi = StatusPembayaran._(r'MenungguKonfirmasi');
  static const lunas = StatusPembayaran._(r'Lunas');
  static const gagal = StatusPembayaran._(r'Gagal');

  /// List of all possible values in this [enum][StatusPembayaran].
  static const values = <StatusPembayaran>[
    belumLunas,
    menungguKonfirmasi,
    lunas,
    gagal,
  ];

  static StatusPembayaran? fromJson(dynamic value) => StatusPembayaranTypeTransformer().decode(value);

  static List<StatusPembayaran> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusPembayaran>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusPembayaran.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusPembayaran] to String,
/// and [decode] dynamic data back to [StatusPembayaran].
class StatusPembayaranTypeTransformer {
  factory StatusPembayaranTypeTransformer() => _instance ??= const StatusPembayaranTypeTransformer._();

  const StatusPembayaranTypeTransformer._();

  String encode(StatusPembayaran data) => data.value;

  /// Decodes a [dynamic value][data] to a StatusPembayaran.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusPembayaran? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'BelumLunas': return StatusPembayaran.belumLunas;
        case r'MenungguKonfirmasi': return StatusPembayaran.menungguKonfirmasi;
        case r'Lunas': return StatusPembayaran.lunas;
        case r'Gagal': return StatusPembayaran.gagal;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [StatusPembayaranTypeTransformer] instance.
  static StatusPembayaranTypeTransformer? _instance;
}

