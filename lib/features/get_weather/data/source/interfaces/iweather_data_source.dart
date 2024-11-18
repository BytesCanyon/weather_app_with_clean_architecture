import 'package:weather/core/params/user_params.dart';
import 'package:weather/features/get_weather/data/models/weather_model.dart';

abstract class IWeatherDataSource {
  Future<WeatherModel> getWeather(UserParams params);
}

abstract class IWeatherCacheDataSource {
  Future<void> storeWeather(UserParams params, WeatherModel weather);
  Future<WeatherModel?> getLastWeather();
}
