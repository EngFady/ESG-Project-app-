//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:flutter/material.dart';
//
//class CustomData extends StatefulWidget {
//  const CustomData({Key? key}) : super(key: key);
//
//  @override
//  _CustomDataState createState() => _CustomDataState();
//}
//
//class _CustomDataState extends State<CustomData> {
//  final referenceData = FirebaseDatabase.instance;
//  @override
//  Widget build(BuildContext context) {
//    final ref = referenceData.reference();
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Patient outcomes'),
//        centerTitle: true,
//      ),
//      body: SingleChildScrollView(
//        child: Column(
//          children: [
//            Center(
//              child: Container(
//                color: Colors.green,
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.height,
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
