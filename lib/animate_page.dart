import 'package:flutter/material.dart';

class AnimatePage extends StatefulWidget {
  const AnimatePage({Key? key, required this.image, required this.rotateTime}) : super(key: key);

  final String image;
  final int rotateTime;

  @override
  State<AnimatePage> createState() => AnimatePageState();
}

class AnimatePageState extends State<AnimatePage>  with TickerProviderStateMixin{

  late AnimationController animController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(duration: Duration(milliseconds: widget.rotateTime), vsync: this);

    animation = Tween<double>(begin: 0, end: 6.28,).animate(animController)
    ..addListener(() {
      setState(() {});
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animController.forward(from: 0);
      } else if (status == AnimationStatus.dismissed) {
        animController.forward();
      }
    });

    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Transform.rotate(
        angle: animation.value,
        child: Container(
          alignment: Alignment.center,
          child: Image.asset('assets/images/small/${widget.image}'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

}
