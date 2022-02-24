import 'package:flutter/material.dart';
class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Marawan Pablo', style: TextStyle(
            fontSize: 25.05,
            color: Colors.lightGreenAccent.shade400,
            fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(child: Center(child: Text('Choices here',style: TextStyle(fontSize: 40.0),),),),
    );
  }
}
