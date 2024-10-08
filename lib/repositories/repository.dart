abstract class Repository<T> {
  List<T> items = [];

  //crud, create, read, update, delete
  add(T item) {
    items.add(item);
  }

  List<T> getAll() {
    return items;
  }

  // delete(int index) {
  //   items.removeAt(index);
  // }
}
