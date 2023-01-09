import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freemium_hub/firebase_options.dart';
import 'package:freemium_hub/themes/theme_data.dart';
import 'package:freemium_hub/ui/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(
    MyApp(showHome: showHome),
  );
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freemium Hub',
      debugShowCheckedModeBanner: false,
      // themeMode: ,
      darkTheme: DarkThemeData.darkTheme,
      theme: LightThemeData.lightTheme,
      home: SplashScreen(
        showHome: showHome,
      ),
      // home: const AuthenticationPage(),
    );
  }
}
