import 'dart:io';
import 'package:uppgift_1/models/person.dart';
import 'package:uppgift_1/repositories/person_repository.dart';
import 'package:uppgift_1/screens/screen_util.dart';

void displayAddPerson() {
  clearScreen();

  stdout.write("Ange personens ID:");
  int? id = int.parse(stdin.readLineSync().toString());

  stdout.write("Ange personens namn:");
  String name = stdin.readLineSync().toString();

  stdout.write("Ange personens personnummer:");
  String personnr = stdin.readLineSync().toString();

  Person person = Person(id, name, personnr);
  personRepo.add(person);

  stdout.writeln("Person skapad med följande uppgifter:\n");
  stdout.writeln(person.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void displayShowAllPersons() {
  clearScreen();
  stdout.writeln("Följande personer finns lagrade:\n");
  stdout.writeln(personRepo.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}
