import 'package:bullet/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'page5.dart';

class HDForm extends StatefulWidget {
  @override
  _HDFormState createState() => _HDFormState();
}

class _HDFormState extends State<HDForm> {

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(future: _initializeFirebase(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return DForm();
        }
        return const Center(child: CircularProgressIndicator(),);
      }
      ),

    );
  }
}





class DForm extends StatefulWidget {
  @override
  State<DForm> createState() => _DFormState();
}

class _DFormState extends State<DForm> {
// login function
// ignore: non_constant_identifier_names
static Future<User?> loginUsingEmailPassword({required String email, required String password, required  BuildContext context }) async
{
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email, password: password);
    user = userCredential.user;
  } on FirebaseAuthException catch (e) {
    if(e.code == 'user-not-found'){
      print("the email is not correct");
    }
  }
  return user;
}

  @override
  Widget build(BuildContext context) {

  TextEditingController emcontrol = TextEditingController();
  TextEditingController passcontrol = TextEditingController();

    return Scaffold(appBar: AppBar(title: Text('DoctorForm'),),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text('ElectroCardioGram ',
            style: TextStyle(fontSize: 22.0,
              fontWeight: FontWeight.bold, color: Colors.black),),
          const Text('Login to the app  : ',
            style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 22.0,),
           TextField(
            controller: emcontrol,
            keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Email'
          ),

          ),
          const SizedBox(height: 15.0,),
          TextField(keyboardType: TextInputType.emailAddress,
            controller: passcontrol,
            decoration: const InputDecoration(
                hintText: 'Password'
            ),

          ),
          const SizedBox(height: 50.0,),
          Container(
            width: double.infinity,
            color: Colors.lightBlue.shade700,
            child: RawMaterialButton(onPressed: () async {
              User? user = await loginUsingEmailPassword(email: emcontrol.text, password: passcontrol.text, context: context);
              print(user);
              if (user != null) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
              }
            },
              child: Text('Login', style: TextStyle(fontSize: 25.0, color: Colors.white),),
              padding: EdgeInsets.symmetric(vertical: 20.0),
            elevation: 0.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            ),
            
          ),
        ],
      ),
    ),
    );
  }
}
