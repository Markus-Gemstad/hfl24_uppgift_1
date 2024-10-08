import 'package:uppgift_1/models/base_entity.dart';

class Person extends BaseEntity {
  String name;
  String personnr;

  Person(this.name, this.personnr);

  @override
  String toString() {
    return "Id: $id, Namn: $name, Personnr: $personnr";
  }
}
