//import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PresentacionPage extends StatefulWidget {
  @override
  _PresentacionPageState createState() => _PresentacionPageState();
}

class _PresentacionPageState extends State<PresentacionPage> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000),
        () => Navigator.pushReplacementNamed(context, 'login'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Center(
              child: FractionallySizedBox(
                widthFactor: .6,
                child: SvgPicture.asset(
                  'assets/logoF.svg',
                  height: 280.0,
                ),
              ),
            ),
            Spacer(),
            CircularProgressIndicator(),
            Spacer(),
            Text(
              'Bienvenido',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
