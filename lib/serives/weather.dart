import 'package:clima/serives/location.dart';
import 'package:clima/serives/networking.dart';
import 'package:flutter/cupertino.dart';

const apiKey = '81c04c2529f07905968cc78e03a4e6cc';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(var cityName) async{
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper;
    var weatherData;
    try{
      networkHelper = NetworkHelper(url);
      weatherData = await networkHelper.getData();
      return weatherData;
    }catch(e){
      return null;
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    NetworkHelper networkHelper;
    var weatherData;
    try {
      await location.getCurrentLocation();

      networkHelper = NetworkHelper(
          '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
      weatherData = await networkHelper.getData();
      return weatherData;
    } catch (e) {
      return Text('Couldn\'t connected to internet');
    }
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
