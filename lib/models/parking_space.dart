import 'package:uppgift_1/models/base_entity.dart';

class ParkingSpace extends BaseEntity {
  String address;
  int pricePerHour;

  double get pricePerMinute => pricePerHour / 60;

  ParkingSpace(super.id, this.address, this.pricePerHour);

  ParkingSpace.addNew(address, pricePerHour) : this(0, address, pricePerHour);

  static bool isValidAddress(String? value) {
    // Valid value = string with minimum of 1 letter, max 1000
    if (value != null && value.isNotEmpty && value.length <= 1000) {
      return true;
    }
    return false;
  }

  static bool isValidPricePerHour(String? value) {
    // Valid value number from 0-99999
    if (value != null && RegExp(r'^[0-9]{1,4}$').hasMatch(value)) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return "Id: $id, Address: [$address], Pris per timme: $pricePerHour";
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();
    map.addAll({
      'address': address,
      'pricePerHour': pricePerHour,
    });
    return map;
  }

  factory ParkingSpace.fromJson(Map<String, dynamic> json) {
    return ParkingSpace(
      json['id'] as int,
      json['address'] as String,
      json['pricePerHour'] as int,
    );
  }
}
