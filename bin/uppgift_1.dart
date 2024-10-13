import 'dart:io';
import 'package:uppgift_1/models/menu.dart';
import 'package:uppgift_1/models/parking.dart';
import 'package:uppgift_1/models/parking_space.dart';
import 'package:uppgift_1/models/person.dart';
import 'package:uppgift_1/models/vehicle.dart';
import 'package:uppgift_1/repositories/parking_repository.dart';
import 'package:uppgift_1/repositories/parking_space_repository.dart';
import 'package:uppgift_1/repositories/person_repository.dart';
import 'package:uppgift_1/repositories/vehicle_repository.dart';
import 'package:uppgift_1/screens/screen_util.dart';

void main() {
  prePopulateRepositories();

  bool exit = false;
  while (!exit) {
    MenuItem? selectedMenu = displayMenu(
        "Välkommen till ParkMyCar!\n\nVad vill du hantera?\n", menu);
    if (selectedMenu != null) {
      exit = selectedMenu.doExit;
      bool back = false;
      while (!exit && !back) {
        MenuItem? selectedSubMenu = displayMenu(
            "Du har valt att hantera ${selectedMenu.name}. Vad vill du göra?\n",
            selectedMenu.subMenu!);
        if (selectedSubMenu != null) {
          back = selectedSubMenu.doBack;
          exit = selectedSubMenu.doExit;
          if (selectedSubMenu.screenFunction != null) {
            selectedSubMenu.screenFunction!();
          }
        }
      }
    }
  }
  print("Programmet avslutas...");
}

void prePopulateRepositories() {
  PersonRepository.instance.add(Person.addNew("Markus Gemstad", "1122334455"));
  VehicleRepository.instance.add(Vehicle.addNew("ABC123", VehicleType.car, 1));
  VehicleRepository.instance
      .add(Vehicle.addNew("BCD234", VehicleType.motorcycle, 1));
  ParkingSpaceRepository.instance
      .add(ParkingSpace.addNew("Bergtallsvägen 10, 134 54 Älvsjö", 100));

  DateTime endTime = DateTime.now().add(const Duration(hours: 1));
  ParkingRepository.instance.add(Parking.addNew(1, 1, DateTime.now(), endTime));
}

MenuItem? displayMenu(String intro, List<MenuItem> menu) {
  String choices = "";

  for (var i = 0; i < menu.length; i++) {
    choices += '${i + 1}. ${menu[i].name}\n';
  }

  clearScreen();
  stdout.write("$intro\n$choices\n\nVälj ett alternativ (1-${menu.length}): ");

  int? nr = int.tryParse(stdin.readLineSync()!);
  if (nr != null && nr > 0 && nr <= menu.length) {
    return menu[nr - 1];
  } else {
    return null;
  }
}
