import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tourism/Loginpage.dart';
import 'package:tourism/Signup.dart';
import 'next.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
      routes: {
        '/Signup': (context) => SignUpPage(),
        '/next': (context) => NextPage(),
      },
    );
  }
}
