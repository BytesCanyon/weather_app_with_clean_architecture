import 'package:hive/hive.dart';
import 'package:weather/features/get_weather/data/models/weather_model.dart';
import 'package:weather/core/params/user_params.dart';
import 'package:weather/features/get_weather/data/source/interfaces/iweather_data_source.dart';

class CachedWeatherDataSource implements IWeatherCacheDataSource {
  final Box<WeatherModel> _weatherBox;

  CachedWeatherDataSource({required Box<WeatherModel> weatherBox})
      : _weatherBox = weatherBox;

  Future<WeatherModel> getWeather(UserParams params) async {
    try {
      return Future.value(_weatherBox.get(params.cityName));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> storeWeather(UserParams params, WeatherModel weather) async {
    try {
      await _weatherBox.put(params.cityName, weather);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<WeatherModel?> getLastWeather() async {
    try {
      if (_weatherBox.isNotEmpty) {
        var lastKey = _weatherBox.keys.last;
        return _weatherBox.get(lastKey);
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }
}
