import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_ui/models/hourly_weather_response.dart';
import 'package:weather_ui/service/logging.dart';

import '../models/current_weather_response.dart';
import 'package:dio/dio.dart';

final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://api.openweathermap.org/data/2.5/",
    connectTimeout: 5000,
    receiveTimeout: 3000))
  ..interceptors.add(Logging());

Future<CurrentWeatherResponse?> getCurrentData(context) async {
  CurrentWeatherResponse? weatherResponse;
  try {
    final response = await _dio.get(
        "weather?lat=41.875732&lon=-87.623766&appid=ca76f2c0423e08ef8e032a11479e5a2d&units=metric");
    print(response.data);
    weatherResponse = CurrentWeatherResponse.fromJson(response.data);
    return weatherResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<HourlyWeatherResponse?> getHourlyData(context) async {
  HourlyWeatherResponse? weatherResponse;
  try {
    final response = await _dio.get(
        "forecast?lat=44.34&lon=10.99&appid=ca76f2c0423e08ef8e032a11479e5a2d&units=metric");
    weatherResponse = HourlyWeatherResponse.fromJson(response.data);
    return weatherResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}
