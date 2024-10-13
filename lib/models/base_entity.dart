abstract class BaseEntity {
  int id = 0;

  BaseEntity(this.id);

  static bool isValidId(String? value) {
    // Valid value number from 1-99999
    if (value != null && RegExp(r'^[1-9]|[1-9][0-9]{1,4}$').hasMatch(value)) {
      return true;
    }
    return false;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
