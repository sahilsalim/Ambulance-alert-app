
import 'package:ambulance_alert_app/screen/map.dart';
import 'package:ambulance_alert_app/ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'View/Login_view.dart';
import 'View/Register_view.dart';
import 'View/Verify_email_view.dart';
import 'constants/routes.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
 await dotenv.load(fileName: "assets/config/.env");
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Ambulance Alert App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light) ,
      darkTheme: ThemeData(brightness: Brightness.dark) ,
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (context)=> const Splash(),
        loginroute: (context) => const LoginView(),
        registerroute: (context) => const RegisterView(),
        notesroute :(context) =>const MapScreen(),
        verifyemailroute:(context) =>const Verifyemailview(),
      },
      
     
    );
  }
}
