import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:weather/features/get_weather/presentation/bloc/weather_bloc.dart';
import 'package:weather/features/get_weather/presentation/bloc/weather_state.dart';
import 'package:weather/features/get_weather/presentation/widgets/weather_image.dart';
import 'package:weather/features/get_weather/presentation/widgets/weather_info.dart';
import 'package:weather/features/get_weather/presentation/widgets/weather_stats.dart';
import 'package:weather/features/get_weather/presentation/widgets/weather_bottom_sheet.dart';

import '../widgets/city_country_text.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6E5BFA),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return _buildWeatherStateUI(state, context);
          },
        ),
      ),
    );
  }
}

Widget _buildWeatherStateUI(WeatherState state, BuildContext context) {
  if (state is WeatherLoading) {
    return const Center(child: CircularProgressIndicator());
  } else if (state is WeatherLoaded) {
    if (state.isFromCache) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: AwesomeSnackbarContent(
              title: "You're offline",
              message: "Showing cached data.",
              contentType: ContentType.failure,
            ),
            duration: Duration(seconds: 3),
          ),
        );
      });
    }
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Center(
            child: CityCountryText(
              cityName: state.weather.name,
              countryName: state.weather.sys.country,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: WeatherStats(
            humidity: state.weather.main.humidity.toString(),
            tempMax: (state.weather.main.tempMax - 273.15).ceil().toString(),
            tempMin: (state.weather.main.tempMin - 273.15).floor().toString(),
            tempMaxImagePath: "assets/tempMax.png",
            tempMinImagePath: "assets/tempMin.png",
            humidityImagePath: "assets/humidity.png",
          ),
        ),
        Column(
          children: [
            WeatherImage(
                imagePath: "assets/${state.weather.weather[0].icon}.png"),
            WeatherInfo(
              description: state.weather.weather[0].description.toUpperCase(),
              sunriseTime: DateFormat('HH:mm').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      (state.weather.sys.sunrise + state.weather.timezone) *
                          1000,
                      isUtc: true)),
              sunsetTime: DateFormat('HH:mm').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      (state.weather.sys.sunset + state.weather.timezone) *
                          1000,
                      isUtc: true)),
            ),
          ],
        ),
      ],
    );
  } else if (state is WeatherError) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        state.message,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.2,
        ),
        textAlign: TextAlign.center,
      ),
    ));
  } else {
    return Scaffold(
      body: const Center(
          child: Text(
        'Enter a city name',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          letterSpacing: 1.2,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (_) => WeatherBottomSheet(),
        ),
        child: const Icon(Icons.search),
      ),
    );
  }
}
