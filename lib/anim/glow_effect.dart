import 'dart:async';

import 'package:flutter/material.dart';

class GlowEffectSplashScreen extends StatefulWidget {
  const GlowEffectSplashScreen({super.key});

  @override
  State<GlowEffectSplashScreen> createState() => _GlowEffectStateSplashScreen();
}

class _GlowEffectStateSplashScreen extends State<GlowEffectSplashScreen> {
  var _glowOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 00), () {
      setState(() {
        _glowOpacity = 0.5;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 241, 250, 193)
                    .withOpacity(_glowOpacity),
                blurRadius: 70,
                spreadRadius: 20,
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/images/demo.png'),
        ),
      ),
    );
  }
}
