import 'dart:async';
import 'dart:io';
import 'package:uppgift_1/models/base_entity.dart';
import 'package:uppgift_1/models/vehicle.dart';
import 'package:uppgift_1/repositories/person_repository.dart';
import 'package:uppgift_1/repositories/vehicle_repository.dart';
import 'package:uppgift_1/screens/screen_util.dart';

void screenAddVehicle() {
  clearScreen();

  String regNr = readValidInputString(
      "Ange registreringsnummer (NNNXXX):", Vehicle.isValidRegNrValue);

  int typeIndex = readValidInputInt(
      "Ange type (1 = bil, 2 = motorcykel, 3 = lastbil):",
      Vehicle.isValidVehicleTypeValue);
  VehicleType type = VehicleType.values[typeIndex - 1];

  int personId =
      readValidInputInt("Ange ID på en person:", BaseEntity.isValidId);

  try {
    PersonRepository.instance.getById(personId);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen person med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  Vehicle vehicle = Vehicle.addNew(regNr, type, personId);
  VehicleRepository.instance.add(vehicle);

  stdout.writeln("Fordon skapat med följande uppgifter:\n");
  stdout.writeln(vehicle.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenShowAllVehicles() {
  clearScreen();
  stdout.writeln("Följande fordon finns lagrade:\n");
  loadVehicles();
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

// Some fake sleep etc to get the "Laddar..." to work
void loadVehicles() {
  stdout.write("Laddar");
  var value = 0;
  Future.doWhile(() {
    value++;
    stdout.write('.');
    sleep(const Duration(seconds: 1));
    if (value == 3) {
      stdout.write('\r${VehicleRepository.instance}\n');
      return false;
    }
    return true;
  });
}

void screenUpdateVehicle() {
  clearScreen();

  int id = readValidInputInt(
      "Ange ID på fordon som ska ändras:", BaseEntity.isValidId);

  try {
    VehicleRepository.instance.getById(id);
  } catch (e) {
    stdout.write("\nFEL! Det finns inget fordon med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String regNr = readValidInputString(
      "Ange registreringsnummer (NNNXXX):", Vehicle.isValidRegNrValue);

  int typeIndex = readValidInputInt(
      "Ange type (1 = bil, 2 = motorcykel, 3 = lastbil):",
      Vehicle.isValidVehicleTypeValue);
  VehicleType type = VehicleType.values[typeIndex - 1];

  int personId =
      readValidInputInt("Ange ID på en person:", BaseEntity.isValidId);

  try {
    PersonRepository.instance.getById(personId);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen person med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  Vehicle vehicle = Vehicle(id, regNr, type, personId);
  VehicleRepository.instance.add(vehicle);

  stdout.writeln("Fordonet updaterat med följande uppgifter:\n");
  stdout.writeln(vehicle.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenDeleteVehicle() {
  clearScreen();

  int id = readValidInputInt(
      "Ange ID på fordon som ska tas bort:", BaseEntity.isValidId);

  try {
    VehicleRepository.instance.delete(id);
  } catch (e) {
    stdout.write(
        "\nFEL! Fordon med ID:$id kunde inte tas bort! Errormessage: $e\n");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  stdout.writeln("Fordon med ID:$id har tagits bort!\n");
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}
