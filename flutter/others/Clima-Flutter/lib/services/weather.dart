import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'a3ef35e885a21b6670536fc5018af188';
const openWeatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String city) async {
    Location location = Location();
    await location.getCurrentLocation();

    String apiUrl = '$openWeatherMapUrl?q=$city&APPID=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(apiUrl);
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    String apiUrl = '$openWeatherMapUrl?APPID=$apiKey&lat=${location.lattitude}&lon=${location.longitude}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(apiUrl);
    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
