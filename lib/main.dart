import 'package:flutter/material.dart';
import 'package:interview/edit_person.dart';
import 'package:interview/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:interview/persons.dart';
import 'package:interview/search_screen.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "home",
     routes: {
       home.routeName:(context)=>home(),
       AllPersonScreen.routeName:(context)=>AllPersonScreen(),
       EditPersonScreen.routeName:(context)=>EditPersonScreen(),
       SearchScreen.routeName:(context)=>SearchScreen()
     },
    );
  }
}


