import 'package:uppgift_1/models/base_entity.dart';
import 'package:uppgift_1/repositories/person_repository.dart';

import 'person.dart';

enum VehicleType { car, motorcycle, truck }

class Vehicle extends BaseEntity {
  String regNr;
  VehicleType type;
  int personId;

  Person get owner => PersonRepository.instance.getById(personId);

  Vehicle(this.regNr, this.type, this.personId);

  @override
  String toString() {
    return "Id: $id, RegNr: $regNr, Fordonstyp: ${type.name}, Ägare: [$owner]";
  }
}
