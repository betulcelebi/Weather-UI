import 'package:flutter/cupertino.dart';
import 'package:weather_ui/models/current_weather_response.dart';

import '../service/api_service.dart';

class WeatherProvider with ChangeNotifier {
  currentWeatherResponse response = currentWeatherResponse();
  bool isLoading = false;
  getWeatherData(context) async {
    isLoading = true;
    response = (await getCurrentData(context))!;
    isLoading = false;
    notifyListeners();
  }
}
