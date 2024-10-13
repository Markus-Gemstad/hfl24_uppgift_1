import 'package:intl/intl.dart';
import 'package:uppgift_1/models/base_entity.dart';
import 'package:uppgift_1/models/parking_space.dart';
import 'package:uppgift_1/repositories/parking_space_repository.dart';
import 'package:uppgift_1/repositories/vehicle_repository.dart';

import 'vehicle.dart';

class Parking extends BaseEntity {
  int vehicleId;
  int parkingSpaceId;
  DateTime startTime;
  DateTime endTime;

  Vehicle get vehicle => VehicleRepository.instance.getById(vehicleId);
  ParkingSpace get parkingSpace =>
      ParkingSpaceRepository.instance.getById(parkingSpaceId);

  Parking(super.id, this.vehicleId, this.parkingSpaceId, this.startTime,
      this.endTime);

  Parking.addNew(vehicleId, parkingSpaceId, startTime, endTime)
      : this(0, vehicleId, parkingSpaceId, startTime, endTime);

  static bool isValidDateTime(String? value) {
    // Valid value = "YYYY-MM-DD HH:MM"
    if (value != null &&
        RegExp(r'^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1]) (2[0-3]|[01][0-9]):[0-5][0-9]$')
            .hasMatch(value)) {
      return true;
    }
    return false;
  }

  double calculateParkingCost() {
    Duration parkingTime = startTime.difference(endTime);
    return parkingSpace.pricePerMinute * parkingTime.inMinutes;
  }

  @override
  String toString() {
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    return 'Id: $id, Starttid: ${formatter.format(startTime)}, Sluttid: ${formatter.format(endTime)}, '
        'Parkeringskostnad: ${calculateParkingCost().toStringAsFixed(2)}, '
        'Fordon (ID): ${vehicle.id}, Parkeringsplats (ID): ${parkingSpace.id}';
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicleId': vehicleId,
      'parkingSpaceId': parkingSpaceId,
      'startTime': startTime.toIso8601String(),
      'endTime': startTime.toIso8601String(),
    };
  }

  factory Parking.fromJson(Map<String, dynamic> json) {
    return Parking(
      json['id'] as int,
      json['vehicleId'] as int,
      json['parkingSpaceId'] as int,
      json['startTime'] as DateTime,
      json['endTime'] as DateTime,
    );
  }
}
