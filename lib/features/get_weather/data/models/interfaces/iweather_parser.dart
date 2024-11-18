import '../weather_model.dart';

abstract class IWeatherParser {
  WeatherModel parse(Map<String, dynamic> response);
}
