import 'dart:io';
import 'package:uppgift_1/models/person.dart';
import 'package:uppgift_1/models/vehicle.dart';
import 'package:uppgift_1/repositories/vehicle_repository.dart';
import 'package:uppgift_1/screens/screen_util.dart';

void screenAddVehicle() {
  clearScreen();

  stdout.write("Ange registreringsnummer (XXXNNN):");
  String regNr = stdin.readLineSync().toString();

  stdout.write("Ange type (1 = bil, 2 = motorcykel, 3 = lastbil):");
  int? typeIndex = int.parse(stdin.readLineSync().toString());
  VehicleType type = typeIndex as VehicleType;

  Person person = Person("name", "personnr");
  Vehicle vehicle = Vehicle(regNr, VehicleType.car, person);
  VehicleRepository.instance.update(vehicle);

  stdout.writeln("Person skapad med följande uppgifter:\n");
  stdout.writeln(person.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenShowAllVehicles() {
  clearScreen();
  stdout.writeln("Följande personer finns lagrade:\n");
  stdout.writeln(VehicleRepository.instance.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenUpdateVehicle() {
  clearScreen();

  stdout.writeln(
      "Uppdatera person - lämna fält tomma (tryck ENTER) för att inte uppdatera");

  stdout.write("Ange ID:");
  int? id = int.parse(stdin.readLineSync().toString());

  stdout.write("Ange ett nytt namn:");
  String regNr = stdin.readLineSync().toString();

  stdout.write("Ange ett nytt personnummer:");
  String personnr = stdin.readLineSync().toString();

  Person person = Person("name", "personnr");
  Vehicle vehicle = Vehicle(regNr, VehicleType.car, person);
  vehicle.id = id;
  VehicleRepository.instance.update(vehicle);

  stdout.writeln("Person updaterad med följande uppgifter:\n");
  stdout.writeln(vehicle.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenDeleteVehicle() {
  clearScreen();

  stdout.write("Ange ID på fordon som ska tas bort:");
  int? id = int.parse(stdin.readLineSync().toString());

  VehicleRepository.instance.delete(id);
  stdout.writeln("Fordon med id:$id har tagits bort!\n");
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}
