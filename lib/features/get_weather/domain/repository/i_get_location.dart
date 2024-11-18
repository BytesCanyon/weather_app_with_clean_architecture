import 'package:geolocator/geolocator.dart';

abstract class IGetLocation {
  Future<Position> getCurrentLocation();
}
