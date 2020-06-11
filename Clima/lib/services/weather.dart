import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'ba7aa0bc860bcb326f24fa50081ec9da';

class WeatherModel {
  Future getCityWeatherData(String cityName) async {
    NetworkService networkService = NetworkService.getInstance();

    final data = await networkService.makeGetRequest(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    return data;
  }

  Future getLocationWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    print(location.latitude);
    print(location.longitude);

    NetworkService networkService = NetworkService.getInstance();

    final data = await networkService.makeGetRequest(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    print(data);
    return data;
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
