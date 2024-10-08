import 'package:uppgift_1/models/base_entity.dart';

import 'person.dart';

enum VehicleType { car, motorcycle, truck }

class Vehicle extends BaseEntity {
  String regNr;
  VehicleType type;
  Person owner;

  Vehicle(this.regNr, this.type, this.owner);
}
