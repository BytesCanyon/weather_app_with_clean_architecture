import 'package:weather/features/get_weather/data/models/weather_model.dart';
import '../interfaces/iweather_parser.dart';
import '../sub_models/clouds_sub_model.dart';
import '../sub_models/coord_sub_model.dart';
import '../sub_models/main_sub_model.dart';
import '../sub_models/rain_sub_model.dart';
import '../sub_models/sys_sub_model.dart';
import '../sub_models/weather_sub_model.dart';
import '../sub_models/wind_sub_model.dart';

class JsonWeatherParser implements IWeatherParser {
  @override
  WeatherModel parse(Map<String, dynamic> data) {
    return WeatherModel(
      coord: CoordModel.fromMap(data['coord'] as Map<String, dynamic>),
      weather: List<WeatherSubModel>.from(
        (data['weather'] as List).map<WeatherSubModel>(
          (x) => WeatherSubModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      base: data['base'] as String,
      main: MainModel.fromMap(data['main'] as Map<String, dynamic>),
      visibility: data['visibility'] as int,
      wind: Wind.fromMap(data['wind'] as Map<String, dynamic>),
      rain: data['rain'] != null
          ? Rain.fromMap(data['rain'] as Map<String, dynamic>)
          : null,
      clouds: Clouds.fromMap(data['clouds'] as Map<String, dynamic>),
      dt: data['dt'] as int,
      sys: SysModel.fromMap(data['sys'] as Map<String, dynamic>),
      timezone: data['timezone'] as int,
      id: data['id'] as int,
      name: data['name'] as String,
      cod: data['cod'] as int,
    );
  }
}
