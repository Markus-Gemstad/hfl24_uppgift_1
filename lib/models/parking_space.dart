import 'package:uppgift_1/models/base_entity.dart';

class ParkingSpace extends BaseEntity {
  String address;
  int pricePerHour;

  ParkingSpace(this.address, this.pricePerHour);

  @override
  String toString() {
    return "Id: $id, Address: [$address], Pris per timme: $pricePerHour";
  }
}
