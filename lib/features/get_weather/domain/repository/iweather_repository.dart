import 'package:dartz/dartz.dart';
import 'package:weather/core/errors/failure.dart';
import 'package:weather/core/params/user_params.dart';
import 'package:weather/features/get_weather/domain/entities/weather_entitie.dart';

abstract class IWeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherByCity(String cityName);
  Future<Either<Failure, WeatherEntity>> getWeatherByCoordinates(
      UserParams params);
}
