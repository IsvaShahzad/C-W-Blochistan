import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height:double.infinity,
        child:
        Image.asset('assets/images/balochistan.png'),
      ),

    );
  }
}



