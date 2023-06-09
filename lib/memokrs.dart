import 'package:borclistesi/sehirarama.dart';
import 'package:borclistesi/weater2.dart';
import 'package:borclistesi/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final WeatherData weatherData;

  MainScreen({required this.weatherData});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double? currentTemperature3; //sıcaklık
  int? currentCondition3;
  String city3 = "Suruç";
  String? ulke3;
  String? durum3;

  void getWeatherData2(String city3) async {
    WeatherData2 weatherData2 = WeatherData2(city3);
    await weatherData2.getCurrentTemperature2();

    if (weatherData2.currentTemperature2 == null ||
        weatherData2.currentCondition2 == null) {
      print("API den sıcaklık veya durum bilgisi boş dönüyor.");
    }
    setState(() {
      currentTemperature3 = weatherData2.currentTemperature2;
      city3 = weatherData2.city2!;
      ulke3 = weatherData2.ulke2;
      durum3 = weatherData2.durum2;
    });
  }

  int? temperature;
  Icon? weatherDisplayIcon;
  AssetImage? backgroundImage;
  String? city;
  String? ulke;
  String? durum;
  Icon? icon;

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature!.round();
      city = weatherData.city;
      ulke = weatherData.ulke;
      WeatherDisplayData weatherDisplayData =
      weatherData.getWeatherDisplayData();
      backgroundImage = weatherDisplayData.weatherImage;
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
    getWeatherData2(city3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          city3 =
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return sehirarama();
          }));
          getWeatherData2(city3);
        },
        child: Icon(Icons.add),
      ),
      body: PageView(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: backgroundImage!,
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: weatherDisplayIcon,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text(
                      '$temperature°',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 80.0,
                          letterSpacing: -5),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        ulke!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            letterSpacing: 1),
                      ),
                      Text(
                        city!,
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 40.0,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: backgroundImage!,
                  fit: BoxFit.cover,
                ),
              ),
              constraints: const BoxConstraints.expand(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                      child: weatherDisplayIcon
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text(
                      '$currentTemperature3°',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 80.0,
                          letterSpacing: -5),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        ulke3!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            letterSpacing: 1),
                      ),
                      Text(
                        city3,
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 40.0,
                            letterSpacing: 1),

                      ),
                    ],
                  ),
                ],
              ),
            ),

          ]
      ),
    );
  }
}
