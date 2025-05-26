//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TargetNavigasi {
  /// Instantiate a new enum with the provided [value].
  const TargetNavigasi._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const none = TargetNavigasi._(r'None');
  static const transaksi = TargetNavigasi._(r'Transaksi');
  static const editProfile = TargetNavigasi._(r'EditProfile');

  /// List of all possible values in this [enum][TargetNavigasi].
  static const values = <TargetNavigasi>[
    none,
    transaksi,
    editProfile,
  ];

  static TargetNavigasi? fromJson(dynamic value) => TargetNavigasiTypeTransformer().decode(value);

  static List<TargetNavigasi> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TargetNavigasi>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TargetNavigasi.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TargetNavigasi] to String,
/// and [decode] dynamic data back to [TargetNavigasi].
class TargetNavigasiTypeTransformer {
  factory TargetNavigasiTypeTransformer() => _instance ??= const TargetNavigasiTypeTransformer._();

  const TargetNavigasiTypeTransformer._();

  String encode(TargetNavigasi data) => data.value;

  /// Decodes a [dynamic value][data] to a TargetNavigasi.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TargetNavigasi? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'None': return TargetNavigasi.none;
        case r'Transaksi': return TargetNavigasi.transaksi;
        case r'EditProfile': return TargetNavigasi.editProfile;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [TargetNavigasiTypeTransformer] instance.
  static TargetNavigasiTypeTransformer? _instance;
}

