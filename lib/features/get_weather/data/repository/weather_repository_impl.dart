import 'package:dartz/dartz.dart';
import 'package:weather/core/params/user_params.dart';
import 'package:weather/features/get_weather/data/source/interfaces/iweather_data_source.dart';
import 'package:weather/features/get_weather/domain/entities/weather_entitie.dart';
import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/exceptions/interfaces/iexception_base.dart';
import '../../domain/repository/iweather_repository.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  final IWeatherDataSource _iWeatherDataSource;
  final IWeatherCacheDataSource _cachedWeatherDataSource;
  final INetworkInfo _networkInfo;

  WeatherRepositoryImpl({
    required IWeatherDataSource iWeatherDataSource,
    required IWeatherCacheDataSource cachedWeatherDataSource,
    required INetworkInfo networkInfo,
  })  : _iWeatherDataSource = iWeatherDataSource,
        _cachedWeatherDataSource = cachedWeatherDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherByCity(
      String cityName) async {
    final isConnected = await _networkInfo.isConnected ?? false;

    if (isConnected) {
      try {
        final weather = await _iWeatherDataSource
            .getWeather(UserParams(cityName: cityName));
        await _cachedWeatherDataSource.storeWeather(
            UserParams(cityName: cityName), weather);
        return Right(weather);
      } on IExceptionBase catch (e) {
        return Left(Failure(errMessage: e.message, statusCode: e.statusCode));
      }
    } else {
      return await _getCachedWeather();
    }
  }

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherByCoordinates(
      UserParams params) async {
    final isConnected = await _networkInfo.isConnected ?? false;

    if (isConnected) {
      try {
        final weather = await _iWeatherDataSource.getWeather(params);
        await _cachedWeatherDataSource.storeWeather(params, weather);
        return Right(weather);
      } on IExceptionBase catch (e) {
        return Left(Failure(errMessage: e.message, statusCode: e.statusCode));
      }
    } else {
      return await _getCachedWeather();
    }
  }

  Future<Either<Failure, WeatherEntity>> _getCachedWeather() async {
    try {
      final cachedWeather = await _cachedWeatherDataSource.getLastWeather();
      if (cachedWeather != null) {
        cachedWeather.isCached = true;
        return Right(cachedWeather);
      } else {
        return Left(Failure(
          errMessage: "No internet connection and no cached data available.",
          statusCode: 500,
        ));
      }
    } on IExceptionBase catch (e) {
      return Left(Failure(errMessage: e.message, statusCode: e.statusCode));
    }
  }
}
