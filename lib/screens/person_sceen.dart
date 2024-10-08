import 'dart:io';
import 'package:uppgift_1/models/person.dart';
import 'package:uppgift_1/repositories/person_repository.dart';
import 'package:uppgift_1/screens/screen_util.dart';

void screenAddPerson() {
  clearScreen();

  stdout.write("Ange namn:");
  String name = stdin.readLineSync().toString();

  stdout.write("Ange personnummer (YYMMDDNNNN):");
  String personnr = stdin.readLineSync().toString();

  Person person = Person(name, personnr);
  PersonRepository.instance.add(person);

  stdout.writeln("Person skapad med följande uppgifter:\n");
  stdout.writeln(person.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenShowAllPersons() {
  clearScreen();
  stdout.writeln("Följande personer finns lagrade:\n");
  stdout.writeln(PersonRepository.instance.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenUpdatePerson() {
  clearScreen();

  stdout.writeln(
      "Uppdatera person - lämna fält tomma (tryck ENTER) för att lämna uppgift oförändrad.");

  stdout.write("Ange personens ID:");
  int? id = int.parse(stdin.readLineSync().toString());

  stdout.write("Ange ett nytt namn:");
  String name = stdin.readLineSync().toString();

  stdout.write("Ange ett nytt personnummer:");
  String personnr = stdin.readLineSync().toString();

  Person person = Person(name, personnr);
  person.id = id;
  PersonRepository.instance.update(person);

  stdout.writeln("Person updaterad med följande uppgifter:\n");
  stdout.writeln(person.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenDeletePerson() {
  clearScreen();

  stdout.write("Ange ID på person som ska tas bort:");
  int? id = int.parse(stdin.readLineSync().toString());

  PersonRepository.instance.delete(id);
  stdout.writeln("Person med id:$id har tagits bort:\n");
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}
