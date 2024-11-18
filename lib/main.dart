import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'config/dependency_injection.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/get_weather/presentation/bloc/weather_bloc.dart';
import 'features/get_weather/presentation/screens/weather_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await setupDependencyInjection();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<WeatherBloc>(),
      child: const MaterialApp(
        home: WeatherScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
