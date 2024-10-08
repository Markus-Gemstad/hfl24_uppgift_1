class ParkingSpace {
  int id;
  String address;
  int pricePerHour;

  ParkingSpace(this.id, this.address, this.pricePerHour);
}

class ParkingSpaceRepository {
  Set<ParkingSpace> parkingSpaces = {};

  add(ParkingSpace parkingSpace) {
    parkingSpaces.add(parkingSpace);
  }

  // <ParkingSpace>{} getAll(){
  //   return parkingSpaces;
  // }
}
