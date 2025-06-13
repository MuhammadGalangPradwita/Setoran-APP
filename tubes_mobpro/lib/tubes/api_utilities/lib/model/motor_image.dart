//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MotorImage {
  /// Returns a new [MotorImage] instance.
  MotorImage({
    this.id,
    this.idMotor,
    this.front,
    this.left,
    this.right,
    this.rear,
    this.motor,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? idMotor;

  String? front;

  String? left;

  String? right;

  String? rear;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Motor? motor;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MotorImage &&
    other.id == id &&
    other.idMotor == idMotor &&
    other.front == front &&
    other.left == left &&
    other.right == right &&
    other.rear == rear &&
    other.motor == motor;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (idMotor == null ? 0 : idMotor!.hashCode) +
    (front == null ? 0 : front!.hashCode) +
    (left == null ? 0 : left!.hashCode) +
    (right == null ? 0 : right!.hashCode) +
    (rear == null ? 0 : rear!.hashCode) +
    (motor == null ? 0 : motor!.hashCode);

  @override
  String toString() => 'MotorImage[id=$id, idMotor=$idMotor, front=$front, left=$left, right=$right, rear=$rear, motor=$motor]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.idMotor != null) {
      json[r'idMotor'] = this.idMotor;
    } else {
      json[r'idMotor'] = null;
    }
    if (this.front != null) {
      json[r'front'] = this.front;
    } else {
      json[r'front'] = null;
    }
    if (this.left != null) {
      json[r'left'] = this.left;
    } else {
      json[r'left'] = null;
    }
    if (this.right != null) {
      json[r'right'] = this.right;
    } else {
      json[r'right'] = null;
    }
    if (this.rear != null) {
      json[r'rear'] = this.rear;
    } else {
      json[r'rear'] = null;
    }
    if (this.motor != null) {
      json[r'motor'] = this.motor;
    } else {
      json[r'motor'] = null;
    }
    return json;
  }

  /// Returns a new [MotorImage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MotorImage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MotorImage[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MotorImage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MotorImage(
        id: mapValueOfType<int>(json, r'id'),
        idMotor: mapValueOfType<int>(json, r'idMotor'),
        front: mapValueOfType<String>(json, r'front'),
        left: mapValueOfType<String>(json, r'left'),
        right: mapValueOfType<String>(json, r'right'),
        rear: mapValueOfType<String>(json, r'rear'),
        motor: Motor.fromJson(json[r'motor']),
      );
    }
    return null;
  }

  static List<MotorImage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MotorImage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MotorImage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MotorImage> mapFromJson(dynamic json) {
    final map = <String, MotorImage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MotorImage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MotorImage-objects as value to a dart map
  static Map<String, List<MotorImage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MotorImage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MotorImage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

