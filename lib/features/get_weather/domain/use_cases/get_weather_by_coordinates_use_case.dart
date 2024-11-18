import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather/core/connection/network_info.dart';
import 'package:weather/core/errors/failure.dart';
import 'package:weather/features/get_weather/domain/repository/i_get_location.dart';

import '../entities/weather_entitie.dart';
import '../repository/iweather_repository.dart';

class GetWeatherByCoordinatesUseCase {
  final IWeatherRepository weatherRepository;
  final IGetLocation getLocationRepository;
  final INetworkInfo networkInfo;

  GetWeatherByCoordinatesUseCase({
    required this.weatherRepository,
    required this.getLocationRepository,
    required this.networkInfo,
  });

  Future<Either<Failure, WeatherEntity>> execute() async {
    String cityName = "";
    try {
      final isConnected = await networkInfo.isConnected ?? false;
      if (isConnected) {
        final position = await getLocationRepository.getCurrentLocation();

        final placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        cityName = placemarks.isNotEmpty ? placemarks[0].locality ?? "" : "";

        if (cityName.isEmpty) {
          return Left(Failure(
              errMessage: "Unable to determine city name from location"));
        }
      }

      return await weatherRepository.getWeatherByCity(cityName);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
