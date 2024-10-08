import 'package:uppgift_1/models/person.dart';
import 'package:uppgift_1/repositories/repository.dart';

var personRepo = PersonRepository();

class PersonRepository extends Repository<Person> {
  Person getByName(String name) {
    return items.firstWhere((element) => element.name == name);
  }

  void update(Person person) {
    // Add implementation
  }

  void delete(int id) {
    items.remove(getById(id));
  }

  Person getById(id) {
    return items.firstWhere((element) => element.id == id);
  }

  @override
  String toString() {
    return items.join("-");
  }
}
