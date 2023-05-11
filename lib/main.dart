
import 'package:ambulance_alert_app/ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
 await dotenv.load(fileName: "assets/config/.env");
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambulance Alert App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light) ,
      darkTheme: ThemeData(brightness: Brightness.dark) ,
      themeMode: ThemeMode.dark,
      home: const Splash(),
     
    );
  }
}
