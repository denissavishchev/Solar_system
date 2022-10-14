import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'constants.dart';


class ListOfPlanets extends StatefulWidget {
  const ListOfPlanets({Key? key}) : super(key: key);

  @override
  State<ListOfPlanets> createState() => ListOfPlanetsState();
}

class ListOfPlanetsState extends State<ListOfPlanets> {

  static String planetImage = '';
  static String planetName = '';
  static int bg = 0;
  static String planetDesc = '';
  static String planetMoons = '';

  void planet(String planets, String names, bgColor, String description, String moons) {
    setState(() {
      Navigator.of(context).pushNamed('/planet_page');
      planetImage = planets;
      planetName = names;
      bg = bgColor;
      planetDesc = description;
      planetMoons = moons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.maxFinite,
        height: 600,
        color: Colors.transparent,
        child: PageView.builder(
          controller: PageController(
            viewportFraction: 0.75
          ),
          scrollDirection: Axis.horizontal,
            itemCount: names.length,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  planet(planets[index], names[index], bgColors[index], description[index], moons[index]);
                  },
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Color(bgColors[index]).withOpacity(0.7),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                          child: Image.asset('assets/images/${planets[index]}', fit: BoxFit.contain,)),
                      LocaleText(names[index], style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),),
                      const SizedBox(height: 20,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 80),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                    height: 30,
                                    child: Image.asset('assets/images/molecule.png')),
                                const SizedBox(width: 10,),
                                LocaleText(material[index], style: textStyle,),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset('assets/images/radius.png')),
                                const SizedBox(width: 10,),
                                Text(radius[index], style: textStyle,),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset('assets/images/thermometer.png')),
                                const SizedBox(width: 10,),
                                Text(temperature[index], style: textStyle,),

                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset('assets/images/weight.png')),
                                const SizedBox(width: 10,),
                                Text(mass[index], style: textStyle,),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
