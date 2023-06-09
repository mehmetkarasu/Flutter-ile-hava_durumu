import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class WeatherData2 {
  var apiKey = "3312859e5fe29f0f6de2779bb921a8fc";
  double? currentTemperature2; //sıcaklık
  int? currentCondition2;
  String? city2;
  String? ulke2;
  String? durum2;
  Icon? icon2;
  WeatherData2(this.city2);

  Future<void> getCurrentTemperature2() async {

    var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city2&appid=$apiKey&lang=tr&units=metric");
    Response response = await get(url);

    if (response.statusCode == 200) {
      var currentWeather = jsonDecode(response.body);

      try {
        currentTemperature2 = currentWeather['main']['temp'];
        currentCondition2 = currentWeather['weather'][0]['id'];
        city2 = currentWeather['name'];
        ulke2 = currentWeather["sys"]["country"];
        durum2= currentWeather['weather'][0]["description"];
        icon2= currentWeather['weather'][0]["icon"];
      } catch (e) {
        print(e);
        SpinKitFadingCircle(
          color: Colors.white,
          size: 150.0,
          duration: Duration(milliseconds: 1200),
        );
      }
    }
    else {
      print("API den değer gelmiyor!");
      SpinKitFadingCircle(
        color: Colors.white,
        size: 150.0,
        duration: Duration(milliseconds: 1200),
      );
    }
  }

}
