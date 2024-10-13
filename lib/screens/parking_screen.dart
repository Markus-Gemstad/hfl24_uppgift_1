import 'dart:io';
import 'package:uppgift_1/models/base_entity.dart';
import 'package:uppgift_1/models/parking.dart';
import 'package:uppgift_1/repositories/parking_repository.dart';
import 'package:uppgift_1/repositories/parking_space_repository.dart';
import 'package:uppgift_1/repositories/vehicle_repository.dart';
import 'package:uppgift_1/screens/screen_util.dart';

void screenAddParking() {
  clearScreen();

  int vehicleId =
      readValidInputInt("Ange ID på ett fordon:", BaseEntity.isValidId);

  try {
    VehicleRepository.instance.getById(vehicleId);
  } catch (e) {
    stdout.write("\nFEL! Det finns inget fordon med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  int parkingSpaceId =
      readValidInputInt("Ange ID på en parkeringsplats:", BaseEntity.isValidId);

  try {
    ParkingSpaceRepository.instance.getById(vehicleId);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen parkeringsplats med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String startTimeString = readValidInputString(
      "Ange starttid (YYYY-MM-DD HH:MM):", Parking.isValidDateTime);
  DateTime startTime = DateTime.parse(startTimeString);

  String endTimeString = readValidInputString(
      "Ange sluttid (YYYY-MM-DD HH:MM):", Parking.isValidDateTime);
  DateTime endTime = DateTime.parse(endTimeString);

  Parking parking =
      Parking.addNew(vehicleId, parkingSpaceId, startTime, endTime);
  ParkingRepository.instance.add(parking);

  stdout.writeln("Parkering skapat med följande uppgifter:\n");
  stdout.writeln(parking.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenShowAllParkings() {
  clearScreen();
  stdout.writeln("Följande parkeringar finns lagrade:\n");
  stdout.writeln(ParkingRepository.instance.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenUpdateParking() {
  clearScreen();

  int id = readValidInputInt(
      "Ange ID på parkeringen som ska ändras:", BaseEntity.isValidId);

  try {
    ParkingRepository.instance.getById(id);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen parkering med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  int vehicleId =
      readValidInputInt("Ange ID på ett fordon:", BaseEntity.isValidId);

  try {
    VehicleRepository.instance.getById(vehicleId);
  } catch (e) {
    stdout.write("\nFEL! Det finns inget fordon med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  int parkingSpaceId =
      readValidInputInt("Ange ID på en parkeringsplats:", BaseEntity.isValidId);

  try {
    ParkingSpaceRepository.instance.getById(vehicleId);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen parkeringsplats med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String startTimeString = readValidInputString(
      "Ange starttid (YYYY-MM-DD HH:MM):", Parking.isValidDateTime);
  DateTime startTime = DateTime.parse(startTimeString);

  String endTimeString = readValidInputString(
      "Ange sluttid (YYYY-MM-DD HH:MM):", Parking.isValidDateTime);
  DateTime endTime = DateTime.parse(endTimeString);

  Parking parking = Parking(id, vehicleId, parkingSpaceId, startTime, endTime);
  ParkingRepository.instance.update(parking);

  stdout.writeln("Parkeringen updaterad med följande uppgifter:\n");
  stdout.writeln(parking.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenDeleteParking() {
  clearScreen();

  int id = readValidInputInt(
      "Ange ID på parkeringen som ska tas bort:", BaseEntity.isValidId);

  try {
    ParkingRepository.instance.delete(id);
  } catch (e) {
    stdout.write(
        "\n\nFEL! Parkering med ID:$id kunde inte tas bort! Errormessage: $e\n");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  stdout.writeln("Parkering med ID:$id har tagits bort!\n");
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}
