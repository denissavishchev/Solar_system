import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

enum Flag {
  usa,
  ussr,
  pol,
}

class FlagButton extends StatelessWidget {
  const FlagButton({Key? key, required this.image, required this.onTap, required this.color}) : super(key: key);

  final String image;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
            color,
            BlendMode.saturation),
          child: Image.asset(image, fit: BoxFit.fill,)
      ),
    );
  }
}

class FlagsButtons extends StatefulWidget {
  const FlagsButtons({Key? key}) : super(key: key);

  @override
  State<FlagsButtons> createState() => FlagsButtonsState();
}

class FlagsButtonsState extends State<FlagsButtons> {

  static Flag selected = Flag.usa;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 150,
      height: 50,
      color: Colors.transparent,
      child: Row(
        children: [


          Expanded(
            child: FlagButton(image: 'assets/images/usa.png',
                color: selected == Flag.usa ? Colors.transparent : Colors.grey,
                onTap: () {
                  setState(() {
                    selected = Flag.usa;
                    LocaleNotifier.of(context)?.change('en');
                  });
                }),
          ),
          const SizedBox(width: 5,),
          Expanded(
            child: FlagButton(image: 'assets/images/pol.png',
                color: selected == Flag.pol ? Colors.transparent : Colors.grey,
                onTap: () {
                  setState(() {
                    selected = Flag.pol;
                    LocaleNotifier.of(context)?.change('pl');
                  });
                }),
          ),
          const SizedBox(width: 5,),
          Expanded(
            child: FlagButton(image: 'assets/images/ussr.png',
                color: selected == Flag.ussr ? Colors.transparent : Colors.grey,
                onTap: () {
                  setState(() {
                    selected = Flag.ussr;
                    LocaleNotifier.of(context)?.change('ru');
                  });
                }),
          ),
        ],

      ),
    );
  }
}



