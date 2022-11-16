import 'package:flutter/cupertino.dart';
import 'package:weather_ui/models/current_weather_response.dart';
import 'package:weather_ui/models/hourly_weather_response.dart';

import '../service/api_service.dart';

class WeatherProvider with ChangeNotifier {
  CurrentWeatherResponse response = CurrentWeatherResponse();

  bool isLoading = true;
  String newDate="2022-11-10"
;
  getWeatherData(context) async {
    isLoading = true;
    //await Duration(milliseconds: 20);
    response = (await getCurrentData(context))!;

    isLoading = false;
    notifyListeners();
  }

  HourlyWeatherResponse hourlyResponse = HourlyWeatherResponse();
  getHourlyWeatherData(context) async {
    isLoading = true;
    //await Duration(milliseconds: 20);
    hourlyResponse = (await getHourlyData(context))!;
    print(hourlyResponse.toJson());
    isLoading = false;
    notifyListeners();
  }
}
