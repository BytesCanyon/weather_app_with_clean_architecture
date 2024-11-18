import 'package:weather/core/databases/api/end_points.dart';
import 'package:weather/core/databases/api/implementations/api_consumer.dart';
import 'package:weather/core/params/user_params.dart';
import 'package:weather/features/get_weather/data/models/weather_model.dart';
import 'package:weather/features/get_weather/data/source/interfaces/iweather_data_source.dart';

import '../../models/interfaces/iweather_parser.dart';

class RemoteWeatherDataSource implements IWeatherDataSource {
  final ApiConsumer _apiConsumer;
  final IWeatherParser _iWeatherParser;

  RemoteWeatherDataSource({
    required ApiConsumer apiConsumer,
    required IWeatherParser iWeatherParser,
  })  : _apiConsumer = apiConsumer,
        _iWeatherParser = iWeatherParser;

  @override
  Future<WeatherModel> getWeather(UserParams params) async {
    try {
      final response =
          await _apiConsumer.get(EndPoints.weatherByCity(params.cityName));
      return _iWeatherParser.parse(response as Map<String, dynamic>);
    } catch (error) {
      rethrow;
    }
  }
}
