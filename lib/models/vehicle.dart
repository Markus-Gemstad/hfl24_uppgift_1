import 'person.dart';

enum Type { car, motorcycle, truck }

class Vehicle {
  String regNr;
  Type type;
  Person owner;

  Vehicle(this.regNr, this.type, this.owner);
}

class VehicleRepository {
  //add(item)
  //getAll()
  //getById(id)
  //update(item)
  //delete(id)
}
