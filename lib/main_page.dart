import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:solar_system/flags_buttons.dart';
import 'list_of_planets.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpeg',),fit: BoxFit.fill
            )
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator.of(context).pushNamed('/start_page');
                              },
                              icon: const Icon(Icons.close, color: Colors.white,)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const LocaleText("planets", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),),
                              LocaleText("solar_system", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)),),
                            ],
                          ),
                        ],
                      ),
                      const FlagsButtons(),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Expanded(
                    child: ListOfPlanets()),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
