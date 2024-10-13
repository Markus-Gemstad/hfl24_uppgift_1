import 'dart:io';
import 'package:uppgift_1/models/base_entity.dart';
import 'package:uppgift_1/models/person.dart';
import 'package:uppgift_1/repositories/person_repository.dart';
import 'package:uppgift_1/screens/screen_util.dart';

void screenAddPerson() {
  clearScreen();

  String name =
      readValidInputString("Ange namn (1-255 tecken):", Person.isValidName);

  String personnr = readValidInputString(
      "Ange personnummer (YYYYMMDDNNNN):", Person.isValidPersonNr);

  Person person = Person.addNew(name, personnr);
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

  int id = readValidInputInt(
      "Ange ID på person som ska ändras:", BaseEntity.isValidId);

  try {
    PersonRepository.instance.getById(id);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen person med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String name = readValidInputString(
      "Ange ett nytt namn (1-255 tecken):", Person.isValidName);

  String personnr = readValidInputString(
      "Ange ett nytt personnummer (YYYYMMDDNNNN):", Person.isValidPersonNr);

  Person person = Person(id, name, personnr);
  PersonRepository.instance.update(person);

  stdout.writeln("Person updaterad med följande uppgifter:\n");
  stdout.writeln(person.toString());
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenDeletePerson() {
  clearScreen();

  int id = readValidInputInt(
      "Ange ID på person som ska tas bort:", BaseEntity.isValidId);

  try {
    PersonRepository.instance.delete(id);
  } catch (e) {
    stdout.write(
        "\nFEL! Person med ID:$id kunde inte tas bort! Errormessage: $e\n");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  stdout.writeln("Person med ID:$id har tagits bort:\n");
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}
