import 'package:geolocator/geolocator.dart';
import '../repository/i_get_location.dart';

class GetLocationUseCase {
  final IGetLocation locationRepository;

  GetLocationUseCase(this.locationRepository);

  Future<Position> execute() async {
    return await locationRepository.getCurrentLocation();
  }
}
