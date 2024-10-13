import 'dart:convert';

import 'package:uppgift_1/models/person.dart';
import 'package:uppgift_1/repositories/repository.dart';

class PersonRepository extends Repository<Person> {
  // Singleton
  static final PersonRepository _instance = PersonRepository._internal();
  PersonRepository._internal(); // Privat konstruktor förhindrar att fler objekt av klassen skapas
  static PersonRepository get instance => _instance;

  @override
  List<Person> parseJson(String jsonString) {
    final parsed =
        (jsonDecode(jsonString) as List).cast<Map<String, dynamic>>();

    return parsed.map<Person>((json) => Person.fromJson(json)).toList();
  }
}
