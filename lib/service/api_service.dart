import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_ui/models/hourly_weather_response.dart';

import '../models/current_weather_response.dart';

Future<CurrentWeatherResponse?> getCurrentData(context) async {
  CurrentWeatherResponse weatherResponse;

  final response = await http.get(Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?lat=41.875732&lon=-87.623766&appid=ca76f2c0423e08ef8e032a11479e5a2d&units=metric"));
  if (response.statusCode == 200) {
    weatherResponse =
        CurrentWeatherResponse.fromJson(jsonDecode(response.body.toString()));
    return weatherResponse;
  }

  return null;
}

Future<HourlyWeatherResponse?> getHourlyData(context) async {
  HourlyWeatherResponse weatherResponse;

  final response = await http.get(Uri.parse(
      "https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=ca76f2c0423e08ef8e032a11479e5a2d&units=metric"));

  if (response.statusCode == 200) {
    weatherResponse =
        HourlyWeatherResponse.fromJson(jsonDecode(response.body.toString()));
    return weatherResponse;
  }

  return null;
}
