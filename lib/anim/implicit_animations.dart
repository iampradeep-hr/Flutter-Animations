import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/* All Implicit Animations follow the same syntax */

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  final String assetName = 'assets/images/orange.svg';
  var _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Orbitron",
      ),
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TweenAnimationBuilder(
              onEnd: () {
                setState(() {
                  _opacity = 1.0;
                });
              },
              duration: const Duration(seconds: 1),
              tween: Tween(begin: 40.0, end: 200.0),
              curve: Curves.easeOutSine,
              builder: (context, value, child) {
                return SvgPicture.asset(height: value, width: value, assetName);
              },
            ),
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _opacity,
              child: const Text("Orange",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.deepOrangeAccent)),
            )
          ]),
        ),
      ),
    );
  }
}
