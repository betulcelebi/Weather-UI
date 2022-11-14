import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/current_weather_response.dart';

Future<currentWeatherResponse?>getCurrentData(context) async{
  currentWeatherResponse weatherResponse;
 try {
  final response =await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=41.875732&lon=-87.623766&appid=ca76f2c0423e08ef8e032a11479e5a2d"));
  weatherResponse=currentWeatherResponse.fromJson(jsonDecode(response.body));
  print(response.body);
  return weatherResponse;
 } catch(e){
  log(e.toString());
 }
 return null;
}