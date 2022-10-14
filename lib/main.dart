import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solar_system/main_page.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:solar_system/planet_page.dart';
import 'package:solar_system/start_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'pl', 'ru']);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) =>
      MaterialApp(

        debugShowCheckedModeBanner: false,
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,

          routes: {
            '/main_page': (context) => const MainPage(),
            '/planet_page': (context) => const PlanetPage(),
            '/start_page': (context) => const StartPage(),
          },
          initialRoute: '/start_page',

        home: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpeg',),fit: BoxFit.fill
            )
          ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
                // child: const MainPage()
            ),
        ),
      ),
    );
  }
}
