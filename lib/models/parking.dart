import 'package:uppgift_1/models/base_entity.dart';
import 'package:uppgift_1/repositories/vehicle_repository.dart';

import 'vehicle.dart';

class Parking extends BaseEntity {
  int vehicleId;
  int parkingSpaceId;
  //ParkingSpace get parkingSpace => ParkingSpaceRepository.
  DateTime startTime;
  DateTime endTime;

  Vehicle get vehicle => VehicleRepository.instance.getById(vehicleId);

  Parking(this.vehicleId, this.parkingSpaceId, this.startTime, this.endTime);

  @override
  String toString() {
    return "Id: $id, Fordon: [$vehicle], Parkeringsplats: $parkingSpaceId, Starttid: [$startTime], Sluttid: [$endTime]";
  }
}
