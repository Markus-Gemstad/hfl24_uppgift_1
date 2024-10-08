import 'parking_space.dart';
import 'vehicle.dart';

class Parking {
  Vehicle vehicle;
  ParkingSpace parkingSpace;
  DateTime startTime;
  DateTime endTime;

  Parking(this.vehicle, this.parkingSpace, this.startTime, this.endTime);
}

class ParkingRepository {
  //add(item)
  //getAll()
  //getById(id)
  //update(item)
  //delete(id)
}
