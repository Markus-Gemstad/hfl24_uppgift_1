import 'package:uppgift_1/models/base_entity.dart';

class Person extends BaseEntity {
  String name;
  String personnr;

  Person(super.id, this.name, this.personnr);

  Person.addNew(name, personnr) : this(0, name, personnr);

  static bool isValidName(String? value) {
    // Valid value = string with minimum of 1 letter, max 255
    if (value != null && value.isNotEmpty && value.length <= 255) {
      return true;
    }
    return false;
  }

  static bool isValidPersonNr(String? value) {
    // Valid value = "YYYYMMDD-NNNN"
    if (value != null &&
        RegExp(r'^(((([02468][048]|[13579][26])00|\d\d(0[48]|[2468][048]|[13579][26]))02[28]9)|(\d{4}((0[135789]|1[02])([06][1-9]|[1278]\d|[39][01])|(0[469]|11)([06][1-9]|[1278]\d|[39]0)|(02([06][1-9]|[17]\d|[28][0-8])))))\d{4}$')
            .hasMatch(value)) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return "Id: $id, Namn: $name, Personnr: $personnr";
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'personnr': personnr,
    };
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      json['id'] as int,
      json['name'] as String,
      json['personnr'] as String,
    );
  }
}
