import 'package:uppgift_1/models/parking.dart';
import 'package:uppgift_1/repositories/repository.dart';

class ParkingRepository extends Repository<Parking> {
  // Singleton
  static final ParkingRepository _instance = ParkingRepository._internal();
  ParkingRepository._internal(); // Privat konstruktor förhindrar att fler objekt av klassen skapas
  static ParkingRepository get instance => _instance;
}
