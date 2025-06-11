//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MetodePembayaran {
  /// Instantiate a new enum with the provided [value].
  const MetodePembayaran._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const transferBank = MetodePembayaran._(r'TransferBank');
  static const kartuKredit = MetodePembayaran._(r'KartuKredit');
  static const dompetDigital = MetodePembayaran._(r'DompetDigital');
  static const tunai = MetodePembayaran._(r'Tunai');

  /// List of all possible values in this [enum][MetodePembayaran].
  static const values = <MetodePembayaran>[
    transferBank,
    kartuKredit,
    dompetDigital,
    tunai,
  ];

  static MetodePembayaran? fromJson(dynamic value) => MetodePembayaranTypeTransformer().decode(value);

  static List<MetodePembayaran> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MetodePembayaran>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MetodePembayaran.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MetodePembayaran] to String,
/// and [decode] dynamic data back to [MetodePembayaran].
class MetodePembayaranTypeTransformer {
  factory MetodePembayaranTypeTransformer() => _instance ??= const MetodePembayaranTypeTransformer._();

  const MetodePembayaranTypeTransformer._();

  String encode(MetodePembayaran data) => data.value;

  /// Decodes a [dynamic value][data] to a MetodePembayaran.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MetodePembayaran? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'TransferBank': return MetodePembayaran.transferBank;
        case r'KartuKredit': return MetodePembayaran.kartuKredit;
        case r'DompetDigital': return MetodePembayaran.dompetDigital;
        case r'Tunai': return MetodePembayaran.tunai;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [MetodePembayaranTypeTransformer] instance.
  static MetodePembayaranTypeTransformer? _instance;
}

