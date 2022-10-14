import 'package:flutter/material.dart';

List planets = [
  '1mercury.png',
  '2venus.png',
  '3earth.png',
  '4mars.png',
  '5jupiter.png',
  '6saturn.png',
  '7uranus.png',
  '8neptune.png'
];

List names = ['mercury', 'Venus', 'earth', 'mars', 'jupiter', 'saturn', 'uranus', 'neptune'];

List bgColors = [0xff8d8a88, 0xfff4dbc4, 0xffb8cbdb, 0xfff27b5f, 0xffbfaf9b, 0xff736b5a, 0xff95bbbe, 0xff4e5d74];

List material = ['solid', 'solid', 'solid', 'solid', 'gas', 'gas', 'solid', 'gas',];

List radius = ['2440 km', '6052 km', '6371 km', '3390 km', '69911 km', '58232 km', '25362 km', '24622 km',];

List temperature = ['167', '464', '15', '-65', '-110', '-140', '-195', '-200',];

List mass = ['0.0553', '0.815', '1', '0.107', '318', '95.2', '14.5', '17.1',];

List description = ['mercury_desc', 'venus_desc', 'earth_desc', 'mars_desc', 'jupiter_desc', 'saturn_desc', 'uranus_desc', 'neptune_desc'];

List moons = ['0', '0', '1', '2', '80', '83', '27', '14'];

final textStyle = TextStyle(
  fontSize: 20,
  color: Colors.white.withOpacity(0.8),
);

const descriptionText = TextStyle(
  fontSize: 18,
  color: Colors.white,
);