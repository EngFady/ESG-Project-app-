import 'page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  var case_name = TextEditingController();
  var case_number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Authentication' , style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
      centerTitle: true,
    ),
    
    // the body of the  form
    body: Padding(
       padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Case Details ', style: TextStyle(fontSize: 31.007,fontWeight: FontWeight.bold),),
          SizedBox(height: 36.06,),
          TextFormField(
            controller: case_name,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(

              labelText:  'First Name',
              border: OutlineInputBorder(),
            ),
            onFieldSubmitted: (String _) {
              print(_);
            },
          ),
          SizedBox(height: 36.06,),
          TextFormField(
            controller: case_number,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(

              labelText:  'number of the case',
              border: OutlineInputBorder(),
            ),
            onFieldSubmitted: (String _) {
              print(_);
            },
          ),
          SizedBox(height: 36.06,),
          Container(
            height: 40.02,
            width: double.infinity,
            child:  RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Page3(value: case_number.text,)),
                );
              },
        color: Colors.blue.shade900,
        child: const Text('Submett', style: TextStyle(fontSize: 12))
          ),
          )
        ],

      ),
    ),  
    );
  }
}
class NextPage extends StatefulWidget {
   var value;
  NextPage({ Key ? key,  this.value}): super(key: key);
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Next'),),
    body: Text("case${widget.value}"),
    );
  }
}

