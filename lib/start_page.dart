import 'package:flutter/material.dart';

import 'animate_page.dart';


class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                children: [
                  const SizedBox(height: 100,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    color: Colors.black,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset('assets/images/small/0sunS.png'),
                        const AnimatePage(image: '1mercuryS.png', rotateTime: 880,),
                        const AnimatePage(image: '2venusS.png', rotateTime: 2250,),
                        const AnimatePage(image: '3earthS.png', rotateTime: 3650,),
                        const AnimatePage(image: '4marsS.png', rotateTime: 6870,),
                        const AnimatePage(image: '5jupiterS.png', rotateTime: 21665,),
                        const AnimatePage(image: '6saturnS.png', rotateTime: 53795,),
                        const AnimatePage(image: '7uranusS.png', rotateTime: 76718,),
                        const AnimatePage(image: '8neptuneS.png', rotateTime: 150475,),

                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffd94126). withOpacity(0.1)
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/main_page');
                    },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 50,
                        height: 50,
                        child: Image.asset('assets/images/shuttle.png')),
                  ),),
                ],
              ),
            ));
  }
}
