import 'package:flutter/rendering.dart';

class AppGradient {
  Gradient get backGroundGradient => const LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color.fromARGB(255, 0, 22, 122), Color.fromARGB(255, 0, 153, 255)]);
}
