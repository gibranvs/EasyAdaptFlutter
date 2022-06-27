import 'package:easy_adapt/i18n/translations.g.dart';
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
  bool colorL = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _colorTween =
        ColorTween(begin: Color.fromRGBO(120, 191, 188, 1.0), end: Colors.white)
            .animate(_animationController);

    Future.delayed(Duration(milliseconds: 950), () {
      _animationController.forward();
      setState(() {
        colorL = false;
      });
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
                    left: 0,
                    bottom: 40,
                    child: Image.asset(
                      './assets/gris stroke.png',
                      color: colorL ? Color.fromARGB(255, 222, 217, 217) : null,
                    ),
                    width: 80,
                  ),
                ),
                Container(
                  child: Positioned(
                    left: 30,
                    bottom: 120,
                    child: Image.asset(
                      './assets/gris stroke.png',
                      color: colorL ? Color.fromARGB(255, 222, 217, 217) : null,
                    ),
                    width: 80,
                  ),
                ),
                Container(
                  child: Positioned(
                    left: -60,
                    bottom: 120,
                    child: Image.asset(
                      './assets/gris stroke.png',
                      color: colorL ? Color.fromARGB(255, 222, 217, 217) : null,
                    ),
                    width: 80,
                  ),
                ),
                Container(
                  child: Positioned(
                    right: -40,
                    top: 38,
                    child: Image.asset(
                      './assets/gris stroke.png',
                      color: colorL ? Color.fromARGB(255, 222, 217, 217) : null,
                    ),
                    width: 80,
                  ),
                ),
                Container(
                  child: Positioned(
                    right: 0,
                    top: 110,
                    child: Image.asset(
                      './assets/gris stroke.png',
                      color: colorL ? Color.fromARGB(255, 222, 217, 217) : null,
                    ),
                    width: 80,
                  ),
                ),
                Container(
                  child: Positioned(
                    right: 60,
                    top: 50,
                    child: Image.asset(
                      './assets/gris stroke.png',
                      color: colorL ? Color.fromARGB(255, 222, 217, 217) : null,
                    ),
                    width: 80,
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
