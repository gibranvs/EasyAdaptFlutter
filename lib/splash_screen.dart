import 'package:easy_adapt/routes/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  var prefs;
  SplashScreen({Key? key, required this.prefs}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _colorTween =
        ColorTween(begin: Colors.white, end: Color.fromRGBO(120, 191, 188, 1.0))
            .animate(_animationController);

    Future.delayed(Duration(milliseconds: 950), () {
      _animationController.forward();
    });

    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushReplacementNamed(context, getInitialRoute(widget.prefs));
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _colorTween,
        builder: (context, child) {
          return Container(
            color: _colorTween.value,
            child: Stack(
              children: [
                Container(
                  child: Positioned(
                    left: -160,
                    bottom: 0,
                    child: Image.asset('./assets/fondo_cuadrado.png'),
                    width: 300,
                  ),
                ),
                Container(
                  child: Positioned(
                    right: -160,
                    top: 0,
                    child: Image.asset('./assets/fondo_cuadrado.png'),
                    width: 300,
                  ),
                ),
                Center(
                  child: Image(
                    image: AssetImage('./assets/logo_bl.png'),
                    width: 300,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
