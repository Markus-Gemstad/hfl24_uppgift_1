import 'dart:convert';

import 'package:uppgift_1/models/parking_space.dart';
import 'package:uppgift_1/repositories/repository.dart';

class ParkingSpaceRepository extends Repository<ParkingSpace> {
  // Singleton
  static final ParkingSpaceRepository _instance =
      ParkingSpaceRepository._internal();
  ParkingSpaceRepository._internal(); // Privat konstruktor förhindrar att fler objekt av klassen skapas
  static ParkingSpaceRepository get instance => _instance;

  @override
  List<ParkingSpace> parseJson(String jsonString) {
    final parsed =
        (jsonDecode(jsonString) as List).cast<Map<String, dynamic>>();

    return parsed
        .map<ParkingSpace>((json) => ParkingSpace.fromJson(json))
        .toList();
  }
}
