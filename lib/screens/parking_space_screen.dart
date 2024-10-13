import 'dart:io';
import 'package:uppgift_1/models/base_entity.dart';
import 'package:uppgift_1/models/parking_space.dart';
import 'package:uppgift_1/repositories/parking_space_repository.dart';
import 'package:uppgift_1/screens/screen_util.dart';

void screenAddParkingSpace() {
  clearScreen();

  String address = readValidInputString(
      "Ange adress (1-1000 tecken):", ParkingSpace.isValidAddress);

  int pricePerHour = readValidInputInt(
      "Ange pris per timme:", ParkingSpace.isValidPricePerHour);

  ParkingSpace parkingSpace = ParkingSpace.addNew(address, pricePerHour);
  ParkingSpaceRepository.instance.add(parkingSpace);

  stdout.writeln("Parkeringsplats skapad med följande uppgifter:\n");
  stdout.writeln(parkingSpace.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenShowAllParkingSpaces() {
  clearScreen();
  stdout.writeln("Följande parkringsplatser finns lagrade:\n");
  stdout.writeln(ParkingSpaceRepository.instance.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenUpdateParkingSpace() {
  clearScreen();

  int id = readValidInputInt(
      "Ange ID på parkeringsplats som ska ändras:", BaseEntity.isValidId);

  try {
    ParkingSpaceRepository.instance.getById(id);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen parkeringsplats med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String address = readValidInputString(
      "Ange ny adress (1-1000 tecken):", ParkingSpace.isValidAddress);

  int pricePerHour = readValidInputInt(
      "Ange nytt pris per timme:", ParkingSpace.isValidPricePerHour);

  ParkingSpace parkingSpace = ParkingSpace(id, address, pricePerHour);
  ParkingSpaceRepository.instance.update(parkingSpace);

  stdout.writeln("Parkeringsplats updaterad med följande uppgifter:\n");
  stdout.writeln(parkingSpace.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenDeleteParkingSpace() {
  clearScreen();

  int id = readValidInputInt(
      "Ange ID på parkeringsplats som ska tas bort:", BaseEntity.isValidId);

  try {
    ParkingSpaceRepository.instance.delete(id);
  } catch (e) {
    stdout.write(
        "\nFEL! Parkeringsplats med ID:$id kunde inte tas bort! Errormessage: $e\n");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  stdout.writeln("Parkeringsplats med ID:$id har tagits bort:\n");
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}
