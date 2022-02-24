import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../components/material.dart';
import 'page2.dart';

class Page3 extends StatefulWidget {
  final value;
  Page3({this.value});
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference().child('case${widget.value}/name');
    final ref2 = fb.reference().child('case${widget.value}/result');
    return Scaffold(
        appBar: AppBar(title: const Text('page3'),),
        body: Container(child: Column(children: [
          FirebaseAnimatedList(
            query: ref,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {


              return GestureDetector(
                onTap: () {},
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color:  Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tileColor: Colors.indigo[100],
                        title: (snapshot.value == null) ?   Center(child: CircularProgressIndicator()) :Text(
                          'Hello : ${snapshot.value.toString()}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        )


                    ),
                  ),
                ),
              );
            },
          ),
          FirebaseAnimatedList(
            query: ref2,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {


              return GestureDetector(
                onTap: () {},
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color:  Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tileColor: Colors.indigo[100],
                        title: (snapshot.value == null) ?   Center(child: CircularProgressIndicator()) :Text(
                          'the result : ${snapshot.value.toString()}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        )


                    ),
                  ),
                ),
              );
            },
          ),


        ],),)
    );
  }
}
