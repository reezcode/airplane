import 'dart:async';

import 'package:airplane/ui/pages/get_started_page.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/get-started');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic parentWidth = MediaQuery.of(context).size.width;
    dynamic parentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            width: parentWidth/4,
            height: parentWidth/4,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon_plane.png'
                ),
              )
            ),
          ),
          Text(
            'AIRPLANE',
            style: whiteTextStyle.copyWith(
              fontSize: 32,
              fontWeight: medium,
              letterSpacing: 10
            ),
          )
        ]),
      ),
    );
  }
}