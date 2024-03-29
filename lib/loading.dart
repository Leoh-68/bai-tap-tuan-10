import 'package:baitaptuan_10/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  State<LoadingScreen> createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
              return MyHomePage();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
          (Route route) => false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Loading........",
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(154, 175, 65, 1),
        body: Stack(children: <Widget>[
          Center(
            child: Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(50)),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/VV_icon.png")),
                      border: Border.all(color: Colors.white, width: 10),
                      borderRadius: BorderRadius.all(Radius.circular(250)),
                    ),
                    height: 250,
                    width: 250,
                  ),
                  const Padding(padding: EdgeInsets.all(70)),
                  Center(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (_, child) {
                        return Transform.rotate(
                          angle: _controller.value * 2 * math.pi,
                          child: Image.asset(
                            "images/loading.png",
                            scale: 4,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
