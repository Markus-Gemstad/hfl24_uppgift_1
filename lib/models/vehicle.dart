import 'package:uppgift_1/models/base_entity.dart';
import 'package:uppgift_1/repositories/person_repository.dart';

import 'person.dart';

enum VehicleType { car, motorcycle, truck }

class Vehicle extends BaseEntity {
  String regNr;
  VehicleType type;
  int personId;

  Person get owner => PersonRepository.instance.getById(personId);

  Vehicle(super.id, this.regNr, this.type, this.personId);

  Vehicle.addNew(regNr, type, personId) : this(0, regNr, type, personId);

  static bool isValidRegNrValue(String? value) {
    // Valid value = "NNNXXX"
    if (value != null &&
        RegExp(r'^[A-Za-z]{3}[0-9]{2}[A-Za-z0-9]{1}$').hasMatch(value)) {
      return true;
    }
    return false;
  }

  static bool isValidVehicleTypeValue(String? value) {
    // Valid value = 1, 2, 3
    if (value != null && RegExp(r'^[1-3]{1}$').hasMatch(value)) {
      return true;
    }
    return false;
  }

  bool isValid() {
    return (Vehicle.isValidRegNrValue(regNr));
  }

  @override
  String toString() {
    return "Id: $id, RegNr: $regNr, Fordonstyp: ${type.name}, Ägare (ID): ${owner.id}";
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();
    map.addAll({
      'regNr': regNr,
      'type': type.index,
      'personId': personId,
    });
    return map;
  }

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      json['id'] as int,
      json['regNr'] as String,
      json['type'] as VehicleType,
      json['personId'] as int,
    );
  }
}
