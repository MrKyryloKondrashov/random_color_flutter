import 'dart:math';
import 'package:flutter/material.dart';

final _random = Random();
const _maxColorNumber = 256;
const _maxOpacity = 1.0;


///Return a random color with max opacity
Color getRandomColor() {
  return Color.fromRGBO(
      _random.nextInt(_maxColorNumber),
      _random.nextInt(_maxColorNumber),
      _random.nextInt(_maxColorNumber),
      _maxOpacity,);
}
