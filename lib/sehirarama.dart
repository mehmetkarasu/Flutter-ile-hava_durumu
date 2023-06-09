import 'package:borclistesi/weater2.dart';
import 'package:borclistesi/weather.dart';
import 'package:flutter/material.dart';

class sehirarama extends StatefulWidget {
  sehirarama({Key? key,}) : super(key: key);

  @override
  State<sehirarama> createState() => _sehiraramaState();
}

class _sehiraramaState extends State<sehirarama> {
  double? currentTemperature3; //sıcaklık
  int? currentCondition3;
  String city3= "Suruç";
  String? ulke3;
  String? durum3;
  Icon? weatherDisplayIcon;
  AssetImage? backgroundImage;

  void getWeatherData2(String city3) async {
    WeatherData weatherData;
    WeatherData2 weatherData2 = WeatherData2(city3);
    await weatherData2.getCurrentTemperature2();

    if (weatherData2.currentTemperature2 == null ||
        weatherData2.currentCondition2 == null) {
      print("API den sıcaklık veya durum bilgisi boş dönüyor.");
    }
    setState(() {
      currentTemperature3=weatherData2.currentTemperature2;
      city3=weatherData2.city2!;
      ulke3=weatherData2.ulke2;
      durum3= weatherData2.durum2;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData2(city3);
  }
  late final WeatherData2 karasu;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("şehir arama"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "şehir seçiniz",
                      labelText: "şehir seçiniz",
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed:(){
                      Navigator.pop(context, controller.text,);
                      },
                      icon: Icon(Icons.chevron_right_outlined),
                      iconSize: 35,
                      color: Colors.brown,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

}