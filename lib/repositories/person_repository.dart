import 'package:uppgift_1/models/person.dart';
import 'package:uppgift_1/repositories/repository.dart';

class PersonRepository extends Repository<Person> {
  // Singleton
  static final PersonRepository _instance = PersonRepository._internal();
  PersonRepository._internal(); // Privat konstruktor förhindrar att fler objekt av klassen skapas
  static PersonRepository get instance => _instance;
}
