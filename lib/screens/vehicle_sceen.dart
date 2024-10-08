import 'dart:io';
import 'package:uppgift_1/models/vehicle.dart';
import 'package:uppgift_1/repositories/vehicle_repository.dart';
import 'package:uppgift_1/screens/screen_util.dart';

void screenAddVehicle() {
  clearScreen();

  stdout.write("Ange registreringsnummer (XXXNNN):");
  String regNr = stdin.readLineSync().toString();

  stdout.write("Ange type (1 = bil, 2 = motorcykel, 3 = lastbil):");
  int? typeIndex = int.parse(stdin.readLineSync().toString());
  VehicleType type = VehicleType.values[typeIndex - 1];

  stdout.write("Ange ID på en person:");
  int? personId = int.parse(stdin.readLineSync().toString());

  Vehicle vehicle = Vehicle(regNr, type, personId);
  VehicleRepository.instance.add(vehicle);

  stdout.writeln("Fordon skapat med följande uppgifter:\n");
  stdout.writeln(vehicle.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenShowAllVehicles() {
  clearScreen();
  stdout.writeln("Följande fordon finns lagrade:\n");
  stdout.writeln(VehicleRepository.instance.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenUpdateVehicle() {
  clearScreen();

  stdout.writeln(
      "Uppdatera fordon - lämna fält tomma (tryck ENTER) för att lämna uppgift oförändrad.");

  stdout.write("Ange fordonets ID:");
  int? id = int.parse(stdin.readLineSync().toString());

  stdout.write("Ange registreringsnummer (XXXNNN):");
  String regNr = stdin.readLineSync().toString();

  stdout.write("Ange type (1 = bil, 2 = motorcykel, 3 = lastbil):");
  int? typeIndex = int.parse(stdin.readLineSync().toString());
  VehicleType type = VehicleType.values[typeIndex - 1];

  stdout.write("Ange ID på en person:");
  int? personId = int.parse(stdin.readLineSync().toString());

  Vehicle vehicle = Vehicle(regNr, type, personId);
  vehicle.id = id;
  VehicleRepository.instance.add(vehicle);

  // stdout.writeln("Fordonet updaterat med följande uppgifter:\n");
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
