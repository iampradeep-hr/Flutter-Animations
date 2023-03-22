import 'package:flutter/material.dart';

import 'anim/circle_color_changing_animation.dart';
import 'anim/glow_effect.dart';
import 'anim/implicit_animations.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    
     home:MyApp(),
     
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlowEffect();
  }
}
