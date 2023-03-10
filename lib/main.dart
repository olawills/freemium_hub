import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freemium_hub/presentation/themes/theme_data.dart';
import 'package:freemium_hub/presentation/utils/constants.dart';
import 'package:freemium_hub/firebase_options.dart';
import 'package:freemium_hub/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final documentsDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(documentsDir.path);
  final favsBox = Hive.openBox(favBox);

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freemium Hub',
      debugShowCheckedModeBanner: false,
      darkTheme: DarkThemeData.darkTheme,
      theme: LightThemeData.lightTheme,
      home: SplashScreen(
        showHome: showHome,
      ),
      // home: const AuthenticationPage(),
    );
  }
}
