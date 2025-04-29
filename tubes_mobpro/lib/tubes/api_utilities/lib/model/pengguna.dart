//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Pengguna {
  /// Returns a new [Pengguna] instance.
  Pengguna({
    this.id,
    this.userName,
    this.normalizedUserName,
    this.email,
    this.normalizedEmail,
    this.emailConfirmed,
    this.passwordHash,
    this.securityStamp,
    this.concurrencyStamp,
    this.phoneNumber,
    this.phoneNumberConfirmed,
    this.twoFactorEnabled,
    this.lockoutEnd,
    this.lockoutEnabled,
    this.accessFailedCount,
    this.pelanggan,
    this.notifikasis = const [],
    this.deviceTokens = const [],
    this.nama,
    this.tanggalLahir,
    this.nomorTelepon,
    this.umur,
    this.nomorKTP,
    this.alamat,
    this.idGambar,
  });

  String? id;

  String? userName;

  String? normalizedUserName;

  String? email;

  String? normalizedEmail;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? emailConfirmed;

  String? passwordHash;

  String? securityStamp;

  String? concurrencyStamp;

  String? phoneNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? phoneNumberConfirmed;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? twoFactorEnabled;

  DateTime? lockoutEnd;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? lockoutEnabled;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? accessFailedCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Pelanggan? pelanggan;

  List<Notifikasi>? notifikasis;

  List<DeviceToken>? deviceTokens;

  String? nama;

  DateTime? tanggalLahir;

  String? nomorTelepon;

  int? umur;

  String? nomorKTP;

  String? alamat;

  int? idGambar;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Pengguna &&
    other.id == id &&
    other.userName == userName &&
    other.normalizedUserName == normalizedUserName &&
    other.email == email &&
    other.normalizedEmail == normalizedEmail &&
    other.emailConfirmed == emailConfirmed &&
    other.passwordHash == passwordHash &&
    other.securityStamp == securityStamp &&
    other.concurrencyStamp == concurrencyStamp &&
    other.phoneNumber == phoneNumber &&
    other.phoneNumberConfirmed == phoneNumberConfirmed &&
    other.twoFactorEnabled == twoFactorEnabled &&
    other.lockoutEnd == lockoutEnd &&
    other.lockoutEnabled == lockoutEnabled &&
    other.accessFailedCount == accessFailedCount &&
    other.pelanggan == pelanggan &&
    _deepEquality.equals(other.notifikasis, notifikasis) &&
    _deepEquality.equals(other.deviceTokens, deviceTokens) &&
    other.nama == nama &&
    other.tanggalLahir == tanggalLahir &&
    other.nomorTelepon == nomorTelepon &&
    other.umur == umur &&
    other.nomorKTP == nomorKTP &&
    other.alamat == alamat &&
    other.idGambar == idGambar;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (userName == null ? 0 : userName!.hashCode) +
    (normalizedUserName == null ? 0 : normalizedUserName!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (normalizedEmail == null ? 0 : normalizedEmail!.hashCode) +
    (emailConfirmed == null ? 0 : emailConfirmed!.hashCode) +
    (passwordHash == null ? 0 : passwordHash!.hashCode) +
    (securityStamp == null ? 0 : securityStamp!.hashCode) +
    (concurrencyStamp == null ? 0 : concurrencyStamp!.hashCode) +
    (phoneNumber == null ? 0 : phoneNumber!.hashCode) +
    (phoneNumberConfirmed == null ? 0 : phoneNumberConfirmed!.hashCode) +
    (twoFactorEnabled == null ? 0 : twoFactorEnabled!.hashCode) +
    (lockoutEnd == null ? 0 : lockoutEnd!.hashCode) +
    (lockoutEnabled == null ? 0 : lockoutEnabled!.hashCode) +
    (accessFailedCount == null ? 0 : accessFailedCount!.hashCode) +
    (pelanggan == null ? 0 : pelanggan!.hashCode) +
    (notifikasis == null ? 0 : notifikasis!.hashCode) +
    (deviceTokens == null ? 0 : deviceTokens!.hashCode) +
    (nama == null ? 0 : nama!.hashCode) +
    (tanggalLahir == null ? 0 : tanggalLahir!.hashCode) +
    (nomorTelepon == null ? 0 : nomorTelepon!.hashCode) +
    (umur == null ? 0 : umur!.hashCode) +
    (nomorKTP == null ? 0 : nomorKTP!.hashCode) +
    (alamat == null ? 0 : alamat!.hashCode) +
    (idGambar == null ? 0 : idGambar!.hashCode);

  @override
  String toString() => 'Pengguna[id=$id, userName=$userName, normalizedUserName=$normalizedUserName, email=$email, normalizedEmail=$normalizedEmail, emailConfirmed=$emailConfirmed, passwordHash=$passwordHash, securityStamp=$securityStamp, concurrencyStamp=$concurrencyStamp, phoneNumber=$phoneNumber, phoneNumberConfirmed=$phoneNumberConfirmed, twoFactorEnabled=$twoFactorEnabled, lockoutEnd=$lockoutEnd, lockoutEnabled=$lockoutEnabled, accessFailedCount=$accessFailedCount, pelanggan=$pelanggan, notifikasis=$notifikasis, deviceTokens=$deviceTokens, nama=$nama, tanggalLahir=$tanggalLahir, nomorTelepon=$nomorTelepon, umur=$umur, nomorKTP=$nomorKTP, alamat=$alamat, idGambar=$idGambar]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.userName != null) {
      json[r'userName'] = this.userName;
    } else {
      json[r'userName'] = null;
    }
    if (this.normalizedUserName != null) {
      json[r'normalizedUserName'] = this.normalizedUserName;
    } else {
      json[r'normalizedUserName'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.normalizedEmail != null) {
      json[r'normalizedEmail'] = this.normalizedEmail;
    } else {
      json[r'normalizedEmail'] = null;
    }
    if (this.emailConfirmed != null) {
      json[r'emailConfirmed'] = this.emailConfirmed;
    } else {
      json[r'emailConfirmed'] = null;
    }
    if (this.passwordHash != null) {
      json[r'passwordHash'] = this.passwordHash;
    } else {
      json[r'passwordHash'] = null;
    }
    if (this.securityStamp != null) {
      json[r'securityStamp'] = this.securityStamp;
    } else {
      json[r'securityStamp'] = null;
    }
    if (this.concurrencyStamp != null) {
      json[r'concurrencyStamp'] = this.concurrencyStamp;
    } else {
      json[r'concurrencyStamp'] = null;
    }
    if (this.phoneNumber != null) {
      json[r'phoneNumber'] = this.phoneNumber;
    } else {
      json[r'phoneNumber'] = null;
    }
    if (this.phoneNumberConfirmed != null) {
      json[r'phoneNumberConfirmed'] = this.phoneNumberConfirmed;
    } else {
      json[r'phoneNumberConfirmed'] = null;
    }
    if (this.twoFactorEnabled != null) {
      json[r'twoFactorEnabled'] = this.twoFactorEnabled;
    } else {
      json[r'twoFactorEnabled'] = null;
    }
    if (this.lockoutEnd != null) {
      json[r'lockoutEnd'] = this.lockoutEnd!.toUtc().toIso8601String();
    } else {
      json[r'lockoutEnd'] = null;
    }
    if (this.lockoutEnabled != null) {
      json[r'lockoutEnabled'] = this.lockoutEnabled;
    } else {
      json[r'lockoutEnabled'] = null;
    }
    if (this.accessFailedCount != null) {
      json[r'accessFailedCount'] = this.accessFailedCount;
    } else {
      json[r'accessFailedCount'] = null;
    }
    if (this.pelanggan != null) {
      json[r'pelanggan'] = this.pelanggan;
    } else {
      json[r'pelanggan'] = null;
    }
    if (this.notifikasis != null) {
      json[r'notifikasis'] = this.notifikasis;
    } else {
      json[r'notifikasis'] = null;
    }
    if (this.deviceTokens != null) {
      json[r'deviceTokens'] = this.deviceTokens;
    } else {
      json[r'deviceTokens'] = null;
    }
    if (this.nama != null) {
      json[r'nama'] = this.nama;
    } else {
      json[r'nama'] = null;
    }
    if (this.tanggalLahir != null) {
      json[r'tanggalLahir'] = this.tanggalLahir!.toUtc().toIso8601String();
    } else {
      json[r'tanggalLahir'] = null;
    }
    if (this.nomorTelepon != null) {
      json[r'nomorTelepon'] = this.nomorTelepon;
    } else {
      json[r'nomorTelepon'] = null;
    }
    if (this.umur != null) {
      json[r'umur'] = this.umur;
    } else {
      json[r'umur'] = null;
    }
    if (this.nomorKTP != null) {
      json[r'nomorKTP'] = this.nomorKTP;
    } else {
      json[r'nomorKTP'] = null;
    }
    if (this.alamat != null) {
      json[r'alamat'] = this.alamat;
    } else {
      json[r'alamat'] = null;
    }
    if (this.idGambar != null) {
      json[r'idGambar'] = this.idGambar;
    } else {
      json[r'idGambar'] = null;
    }
    return json;
  }

  /// Returns a new [Pengguna] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Pengguna? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Pengguna[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Pengguna[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Pengguna(
        id: mapValueOfType<String>(json, r'id'),
        userName: mapValueOfType<String>(json, r'userName'),
        normalizedUserName: mapValueOfType<String>(json, r'normalizedUserName'),
        email: mapValueOfType<String>(json, r'email'),
        normalizedEmail: mapValueOfType<String>(json, r'normalizedEmail'),
        emailConfirmed: mapValueOfType<bool>(json, r'emailConfirmed'),
        passwordHash: mapValueOfType<String>(json, r'passwordHash'),
        securityStamp: mapValueOfType<String>(json, r'securityStamp'),
        concurrencyStamp: mapValueOfType<String>(json, r'concurrencyStamp'),
        phoneNumber: mapValueOfType<String>(json, r'phoneNumber'),
        phoneNumberConfirmed: mapValueOfType<bool>(json, r'phoneNumberConfirmed'),
        twoFactorEnabled: mapValueOfType<bool>(json, r'twoFactorEnabled'),
        lockoutEnd: mapDateTime(json, r'lockoutEnd', r''),
        lockoutEnabled: mapValueOfType<bool>(json, r'lockoutEnabled'),
        accessFailedCount: mapValueOfType<int>(json, r'accessFailedCount'),
        pelanggan: Pelanggan.fromJson(json[r'pelanggan']),
        notifikasis: Notifikasi.listFromJson(json[r'notifikasis']),
        deviceTokens: DeviceToken.listFromJson(json[r'deviceTokens']),
        nama: mapValueOfType<String>(json, r'nama'),
        tanggalLahir: mapDateTime(json, r'tanggalLahir', r''),
        nomorTelepon: mapValueOfType<String>(json, r'nomorTelepon'),
        umur: mapValueOfType<int>(json, r'umur'),
        nomorKTP: mapValueOfType<String>(json, r'nomorKTP'),
        alamat: mapValueOfType<String>(json, r'alamat'),
        idGambar: mapValueOfType<int>(json, r'idGambar'),
      );
    }
    return null;
  }

  static List<Pengguna> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Pengguna>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Pengguna.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Pengguna> mapFromJson(dynamic json) {
    final map = <String, Pengguna>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Pengguna.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Pengguna-objects as value to a dart map
  static Map<String, List<Pengguna>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Pengguna>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Pengguna.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

