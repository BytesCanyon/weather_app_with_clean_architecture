import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';

class WeatherBottomSheet extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  WeatherBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _cityController,
            decoration: const InputDecoration(labelText: 'Enter city name'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              final cityName = _cityController.text;
              if (cityName.isNotEmpty) {
                context
                    .read<WeatherBloc>()
                    .add(FetchWeatherByCityEvent(cityName: cityName));
                Navigator.pop(context);
              }
            },
            child: const Text('Fetch Weather by City'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              context.read<WeatherBloc>().add(FetchWeatherByCoordinatesEvent());
              Navigator.of(context).pop();
            },
            child: const Text('Fetch Weather by Current Location'),
          ),
        ],
      ),
    );
  }
}
