import 'dart:convert';

import 'package:uppgift_1/models/vehicle.dart';
import 'package:uppgift_1/repositories/repository.dart';

class VehicleRepository extends Repository<Vehicle> {
  // Singleton
  static final VehicleRepository _instance = VehicleRepository._internal();
  VehicleRepository._internal(); // Privat konstruktor förhindrar att fler objekt av klassen skapas
  static VehicleRepository get instance => _instance;

  @override
  List<Vehicle> parseJson(String jsonString) {
    final parsed =
        (jsonDecode(jsonString) as List).cast<Map<String, dynamic>>();

    return parsed.map<Vehicle>((json) => Vehicle.fromJson(json)).toList();
  }
}
