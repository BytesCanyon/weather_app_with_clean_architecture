import 'package:dartz/dartz.dart';
import 'package:weather/core/errors/failure.dart';
import 'package:weather/core/params/user_params.dart';
import 'package:weather/features/get_weather/domain/entities/weather_entitie.dart';
import 'package:weather/features/get_weather/domain/repository/iweather_repository.dart';

class GetWeatherByCityUseCase {
  final IWeatherRepository _weatherRepository;

  GetWeatherByCityUseCase(this._weatherRepository);

  Future<Either<Failure, WeatherEntity>> execute(UserParams params) async {
    return await _weatherRepository.getWeatherByCity(params.cityName);
  }
}
