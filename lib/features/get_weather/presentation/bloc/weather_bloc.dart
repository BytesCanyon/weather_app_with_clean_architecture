import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/params/user_params.dart';
import 'package:weather/features/get_weather/domain/use_cases/get_weather_by_city_use_case.dart';
import 'package:weather/features/get_weather/domain/use_cases/get_weather_by_coordinates_use_case.dart';
import 'package:weather/features/get_weather/presentation/bloc/weather_event.dart';
import 'package:weather/features/get_weather/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherByCityUseCase getWeatherByCityUseCase;
  final GetWeatherByCoordinatesUseCase getWeatherByCoordinatesUseCase;

  WeatherBloc({
    required this.getWeatherByCityUseCase,
    required this.getWeatherByCoordinatesUseCase,
  }) : super(WeatherInitial()) {
    on<FetchWeatherByCityEvent>(_onFetchWeatherByCity);
    on<FetchWeatherByCoordinatesEvent>(_fetchWeatherByCurrentLocation);
  }

  Future<void> _onFetchWeatherByCity(
      FetchWeatherByCityEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());

    final result = await getWeatherByCityUseCase
        .execute(UserParams(cityName: event.cityName));

    result.fold(
      (failure) => emit(WeatherError(failure.errMessage)),
      (weather) =>
          emit(WeatherLoaded(weather: weather, isFromCache: weather.isCached)),
    );
  }

  Future<void> _fetchWeatherByCurrentLocation(
      FetchWeatherByCoordinatesEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());

    try {
      final result = await getWeatherByCoordinatesUseCase.execute();

      result.fold(
        (failure) => emit(WeatherError(failure.errMessage)),
        (weather) => emit(
            WeatherLoaded(weather: weather, isFromCache: weather.isCached)),
      );
    } catch (error) {
      emit(WeatherError("Failed to retrieve location: $error"));
    }
  }
}
