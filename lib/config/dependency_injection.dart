import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/core/databases/api/implementations/api_consumer.dart';
import 'package:weather/core/databases/api/implementations/dio_client.dart';
import 'package:weather/features/get_weather/data/models/implementations/json_weather_parser.dart';
import 'package:weather/features/get_weather/data/repository/weather_repository_impl.dart';
import 'package:weather/features/get_weather/data/source/cache/cached_weather_data_source.dart';
import 'package:weather/features/get_weather/data/source/remote/remote_weather_data_source.dart';
import 'package:weather/features/get_weather/domain/entities/sub_entites/coord_sub_entity.dart';
import 'package:weather/features/get_weather/domain/entities/sub_entites/main_sub_entity.dart';
import 'package:weather/features/get_weather/domain/entities/sub_entites/sys_sub_entity.dart';
import 'package:weather/features/get_weather/domain/entities/sub_entites/weather_sub_entity.dart';
import 'package:weather/features/get_weather/domain/entities/weather_entitie.dart';
import 'package:weather/core/connection/network_info.dart';
import 'package:weather/core/errors/implementations/dio_error_handler.dart';
import 'package:weather/features/get_weather/domain/use_cases/get_weather_by_coordinates_use_case.dart';
import 'package:weather/features/get_weather/presentation/bloc/weather_bloc.dart';

import '../features/get_weather/data/models/sub_models/clouds_sub_model.dart';
import '../features/get_weather/data/models/sub_models/coord_sub_model.dart';
import '../features/get_weather/data/models/sub_models/main_sub_model.dart';
import '../features/get_weather/data/models/sub_models/rain_sub_model.dart';
import '../features/get_weather/data/models/sub_models/sys_sub_model.dart';
import '../features/get_weather/data/models/sub_models/weather_sub_model.dart';
import '../features/get_weather/data/models/sub_models/wind_sub_model.dart';
import '../features/get_weather/data/models/weather_model.dart';
import '../features/get_weather/data/repository/location_repository_impl.dart';
import '../features/get_weather/data/source/interfaces/iweather_data_source.dart';
import '../features/get_weather/domain/repository/i_get_location.dart';
import '../features/get_weather/domain/use_cases/get_weather_by_city_use_case.dart';

Future<void> setupDependencyInjection() async {
  await registerHiveAdapters();
  setupServiceLocator();
}

Future<void> registerHiveAdapters() async {
  Hive.registerAdapter(WeatherModelAdapter());
  Hive.registerAdapter(CloudsAdapter());
  Hive.registerAdapter(CoordModelAdapter());
  Hive.registerAdapter(MainModelAdapter());
  Hive.registerAdapter(RainAdapter());
  Hive.registerAdapter(WeatherSubModelAdapter());
  Hive.registerAdapter(WindAdapter());
  Hive.registerAdapter(SysModelAdapter());

  Hive.registerAdapter(CoordEntityAdapter());
  Hive.registerAdapter(MainEntityAdapter());
  Hive.registerAdapter(SysEntityAdapter());
  Hive.registerAdapter(WeatherSubEntityAdapter());
  Hive.registerAdapter(WeatherEntityAdapter());

  await Hive.openBox<WeatherModel>('weatherBox');
}

void setupServiceLocator() {
  final sl = GetIt.instance;

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioClient(
        dio: sl<Dio>(),
        iErrorHandler: DioErrorHandler(),
      ));
  sl.registerLazySingleton(() => ApiConsumer(sl<DioClient>()));
  sl.registerLazySingleton(() => JsonWeatherParser());

  sl.registerLazySingleton<RemoteWeatherDataSource>(
      () => RemoteWeatherDataSource(
            apiConsumer: sl<ApiConsumer>(),
            iWeatherParser: sl<JsonWeatherParser>(),
          ));

  sl.registerLazySingleton<IWeatherCacheDataSource>(
      () => CachedWeatherDataSource(
            weatherBox: Hive.box('weatherBox'),
          ));

  sl.registerLazySingleton<INetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));

  sl.registerLazySingleton<WeatherRepositoryImpl>(() => WeatherRepositoryImpl(
        iWeatherDataSource: sl<RemoteWeatherDataSource>(),
        cachedWeatherDataSource: sl<IWeatherCacheDataSource>(),
        networkInfo: sl<INetworkInfo>(),
      ));

  sl.registerLazySingleton<IGetLocation>(() => LocationRepositoryImpl());

  sl.registerLazySingleton(
      () => GetWeatherByCityUseCase(sl<WeatherRepositoryImpl>()));

  sl.registerLazySingleton(() => GetWeatherByCoordinatesUseCase(
        weatherRepository: sl<WeatherRepositoryImpl>(),
        getLocationRepository: sl<IGetLocation>(),
        networkInfo: sl<INetworkInfo>(),
      ));

  sl.registerFactory(() => WeatherBloc(
        getWeatherByCityUseCase: sl<GetWeatherByCityUseCase>(),
        getWeatherByCoordinatesUseCase: sl<GetWeatherByCoordinatesUseCase>(),
      ));
}
