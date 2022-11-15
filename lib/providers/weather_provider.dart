import 'package:flutter/cupertino.dart';
import 'package:weather_ui/models/current_weather_response.dart';

import '../service/api_service.dart';

class WeatherProvider with ChangeNotifier {

  CurrentWeatherResponse response = CurrentWeatherResponse();
  bool isLoading = true;
  getWeatherData(context) async {
    isLoading = true;
    //await Duration(milliseconds: 20);
    response = (await getCurrentData(context))!;
    print(response.toJson());
    isLoading = false;
    notifyListeners();
    
  }
}
