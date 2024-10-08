import 'package:uppgift_1/models/base_entity.dart';

abstract class Repository<T extends BaseEntity> {
  List<T> items = [];
  int _currentId = 1;

  //crud, create, read, update, delete
  add(T item) {
    item.id = _currentId++;
    items.add(item);
  }

  update(T item) {
    int index = items.indexWhere((element) => element.id == item.id);
    items[index] = item;
  }

  delete(int id) {
    items.remove(getById(id));
  }

  T getById(id) {
    return items.firstWhere((element) => element.id == id);
  }

  @override
  String toString() {
    return items.join("\n");
  }
}
