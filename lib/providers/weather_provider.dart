import 'package:flutter/cupertino.dart';
import 'package:weather_ui/models/current_weather_response.dart';
import 'package:weather_ui/models/hourly_weather_response.dart';

import '../service/api_service.dart';

class WeatherProvider with ChangeNotifier {
  CurrentWeatherResponse? response = CurrentWeatherResponse();
  HourlyWeatherResponse? hourlyResponse = HourlyWeatherResponse();

  bool isLoading = true;
  String newDate="2022-11-10";
  String? clockIcon;

  getWeatherData() async {
    isLoading = true;
    //await Duration(milliseconds: 20);
    response = await getCurrentData();
    isLoading = false;
    notifyListeners();
  }

  getHourlyWeatherData() async {
    isLoading = true;
    //await Duration(milliseconds: 20);
    hourlyResponse = await getHourlyData();
    isLoading = false;
    notifyListeners();
  }
}
