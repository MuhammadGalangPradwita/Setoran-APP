//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RegisterForm {
  /// Returns a new [RegisterForm] instance.
  RegisterForm({
    required this.nama,
    required this.email,
    required this.password,
  });

  String nama;

  String email;

  String password;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RegisterForm &&
    other.nama == nama &&
    other.email == email &&
    other.password == password;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (nama.hashCode) +
    (email.hashCode) +
    (password.hashCode);

  @override
  String toString() => 'RegisterForm[nama=$nama, email=$email, password=$password]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'nama'] = this.nama;
      json[r'email'] = this.email;
      json[r'password'] = this.password;
    return json;
  }

  /// Returns a new [RegisterForm] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RegisterForm? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RegisterForm[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RegisterForm[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RegisterForm(
        nama: mapValueOfType<String>(json, r'nama')!,
        email: mapValueOfType<String>(json, r'email')!,
        password: mapValueOfType<String>(json, r'password')!,
      );
    }
    return null;
  }

  static List<RegisterForm> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RegisterForm>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RegisterForm.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RegisterForm> mapFromJson(dynamic json) {
    final map = <String, RegisterForm>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RegisterForm.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RegisterForm-objects as value to a dart map
  static Map<String, List<RegisterForm>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RegisterForm>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RegisterForm.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'nama',
    'email',
    'password',
  };
}

