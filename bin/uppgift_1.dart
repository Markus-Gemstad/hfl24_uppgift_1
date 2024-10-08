import 'dart:io';
import 'package:uppgift_1/models/menu.dart';
import 'package:uppgift_1/screens/screen_util.dart';

void main(List<String> arguments) {
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
          if (selectedSubMenu.displayFunction != null) {
            selectedSubMenu.displayFunction!();
          }
        }
      }
    }
  }
  print("Programmet avslutas...");
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
