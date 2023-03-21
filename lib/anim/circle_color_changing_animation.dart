import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleColorAnimation extends StatefulWidget {
  const CircleColorAnimation({super.key});

  @override
  State<CircleColorAnimation> createState() => _CircleColorAnimationState();
}

class _CircleColorAnimationState extends State<CircleColorAnimation> {
  var _color = getRandomColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
            clipper: MyCircleClipper(),
            child: TweenAnimationBuilder(
              onEnd: () {
                setState(() {
                  _color = getRandomColor();
                });
              },
              tween: ColorTween(
                  begin: getRandomColor(),
                  end: _color), // creating a loop in here
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(value!, BlendMode.srcATop),
                  child: child,
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                color: Colors.redAccent,
              ),
            )),
      ),
    );
  }
}

class MyCircleClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    path.addOval(rect);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

/* 
0xFFFFFFFF
A R G B = 32 bit
A = Alpha (0-255) - 8 bit
R = Red (0-255) - 8 bit
G = Green (0-255) - 8 bit
B = Blue (0-255) - 8 bit
*/

Color getRandomColor() => Color(0xFF000000 + math.Random().nextInt(0x00FFFFFF));
