import 'package:flutter/material.dart';

final Color mainColor = Color(0xFFFF5656);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => MountsApp())));
    });

    return Container(
      color: mainColor,
      child: Stack(
        children: [
          PulsatingLogo(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 80),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PulsatingLogo extends StatefulWidget {
  @override
  _PulsatingLogoState createState() => _PulsatingLogoState();
}

class _PulsatingLogoState extends State<PulsatingLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16, // Adjust the top value according to your preference
      left: 40, // Adjust the left value according to your preference
      child: TweenAnimationBuilder(
        tween: Tween(begin: 1.0, end: 1.3),
        duration: Duration(milliseconds: 1500),
        builder: (context, dynamic value, child) {
          return Transform.scale(
            scale: value,
            child: Image.asset(
              'lib/images/Quicloc8-logo.png', // image asset path
              width: 180,
              height: 180,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class MountsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Welcome to Mounts of the World!')),
    );
  }
}
