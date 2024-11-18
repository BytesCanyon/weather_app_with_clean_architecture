abstract class WeatherEvent {}

class FetchWeatherByCityEvent extends WeatherEvent {
  final String cityName;

  FetchWeatherByCityEvent({required this.cityName});
}

class FetchWeatherByCoordinatesEvent extends WeatherEvent {}
