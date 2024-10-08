class Person {
  int id;
  String name;
  String personnr;

  Person(this.id, this.name, this.personnr);

  @override
  String toString() {
    return "Id: $id, Namn: $name, Personnr: $personnr";
  }
}
