import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/current_weather_response.dart';

Future<CurrentWeatherResponse?> getCurrentData(context) async {
  CurrentWeatherResponse weatherResponse;

  final response = await http.get(Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?lat=41.875732&lon=-87.623766&appid=ca76f2c0423e08ef8e032a11479e5a2d"));
  if (response.statusCode == 200) {
    
    weatherResponse =
        CurrentWeatherResponse.fromJson(jsonDecode(response.body.toString()));
        return weatherResponse;
  }

  return null;

  
}
