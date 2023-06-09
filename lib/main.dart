
import 'package:borclistesi/y%C3%BCkleniyor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      systemNavigationBarColor: Colors.red
    ));
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown, backgroundColor: Colors.brown),
      title: 'Material App',
      home:LoadingScreen()
    );
  }
}
