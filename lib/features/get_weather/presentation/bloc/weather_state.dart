import '../../domain/entities/weather_entitie.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity weather;
  final bool isFromCache;

  WeatherLoaded({
    required this.weather,
    this.isFromCache = false,
  });

  List<Object?> get props => [weather, isFromCache];
}

class WeatherLoadedFromCache extends WeatherState {
  final WeatherEntity weather;
  WeatherLoadedFromCache(this.weather);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}
