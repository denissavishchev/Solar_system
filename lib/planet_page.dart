import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:solar_system/constants.dart';

import 'flags_buttons.dart';
import 'list_of_planets.dart';

class PlanetPage extends StatelessWidget {
  const PlanetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg.jpeg',
                ),
                fit: BoxFit.fill)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/main_page');
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          )),
                      Expanded(
                        child: LocaleText(
                          ListOfPlanetsState.planetName,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const FlagsButtons(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 600,
                    color: Colors.transparent,
                    child: CustomPaint(
                      painter: BottomBox(),
                      child: Stack(
                        children: [
                          Positioned(
                            top: -10,
                            left: MediaQuery.of(context).size.width / 16,
                            child: SizedBox(
                              width: 350,
                              height: 350,
                              child: Image.asset(
                                'assets/images/${ListOfPlanetsState.planetImage}',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 320,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 320,
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset('assets/images/moon.png')),
                                          const SizedBox(width: 10,),
                                          Text(ListOfPlanetsState.planetMoons, style: textStyle,),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 16),
                                          color: Colors.transparent,
                                          child: LocaleText(ListOfPlanetsState.planetDesc, style: descriptionText,),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBox extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint();

    paint.color = Color(ListOfPlanetsState.bg).withOpacity(0.7);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 3.0;
    paint.isAntiAlias = true;

    path.moveTo(0, 30);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, size.height / 3);

    path.quadraticBezierTo(
        size.width - 50, size.height / 3, size.width - 120, size.height - 400);
    path.quadraticBezierTo(size.width / 2, size.height / 3 + 100,
        size.width - 280, size.height - 410);
    path.quadraticBezierTo(size.width - 380, size.height - 500, 0, 30);
    path.lineTo(0, 30);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
