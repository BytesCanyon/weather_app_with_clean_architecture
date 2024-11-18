class EndPoints {
  static const baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  static const apiKey = "9d8794b93e147c37d8e058802cae6d01";

  static String weatherByCity(String cityName) {
    return "$baseUrl?q=$cityName&appid=$apiKey";
  }
}
