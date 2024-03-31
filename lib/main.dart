import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/home_screen.dart';
import 'package:pomodoro_app/screens/register_screen.dart';
import 'package:pomodoro_app/screens/splash_screen.dart';
import 'package:pomodoro_app/screens/login_screen.dart';
// import 'package:pomodoro_app/screens/maintenance_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/splashscreen': (context) => SplashScreen(),
        '/homescreen': (context) => Home(),
        '/loginscreen': (context) => LoginScreen(),
        '/registerscreen': (context) => RegisterScreen(),
        // '/maintenacescreen': (context) => MaintenanceScreen(),
      },
      home: SplashScreen(),
      initialRoute: '/splashscreen',
    );
  }
}
