import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = 'e14503fda53903d910fe44350b520524';
const iniHttp = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$iniHttp?q=$cityName&units=metric&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var locationWeatherData = await networkHelper.getData();
    return locationWeatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$iniHttp?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey');
    var locationWeatherData = await networkHelper.getData();
    return locationWeatherData;
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
