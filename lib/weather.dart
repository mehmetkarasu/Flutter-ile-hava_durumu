import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

import 'location.dart';

class WeatherDisplayData{
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon, required this.weatherImage});


}


class WeatherData{
  var apiKey = "3312859e5fe29f0f6de2779bb921a8fc";
  LocationHelper locationData;
  double? currentTemperature; //sıcaklık
  int? currentCondition;
  String? city;
  String? ulke;
  WeatherData({required this.locationData, this.currentTemperature,this.currentCondition,this.city,this.ulke,});


  Future<void> getCurrentTemperature() async{
    var url = Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric');
    Response response = await get(url);

    if(response.statusCode == 200){
      var currentWeather = jsonDecode(response.body);

      try{
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
        city = currentWeather['name'];
        ulke=currentWeather["sys"]["country"];
      }catch(e){
        print(e);
      }

    }
    else{
      print("API den değer gelmiyor!");
    }

  }

 WeatherDisplayData getWeatherDisplayData(){
    if(currentCondition! <600){
      //hava bulutlu
      return WeatherDisplayData(
          weatherIcon: Icon(
              FontAwesomeIcons.cloud,
              size: 75.0,
              color:Colors.white
          ),
          weatherImage: AssetImage('asets/bulutlu.png'));
    }
    else{
      //hava iyi
      //gece gündüz kontrolü
      var now = new DateTime.now();
      if(now.hour >=19){
        return WeatherDisplayData(
            weatherIcon: Icon(
                FontAwesomeIcons.moon,
                size: 75.0,
                color:Colors.white
            ),
            weatherImage: AssetImage('asets/gece.png'));
      }else{
        return WeatherDisplayData(
            weatherIcon: Icon(
                FontAwesomeIcons.sun,
                size: 75.0,
                color:Colors.white
            ),
            weatherImage: AssetImage('asets/gunesli.png'));

      }
    }
  }


}

