import 'package:flutter/material.dart';
import 'package:interview/firebase_functions.dart';
import 'package:interview/person_model.dart';
import 'package:interview/persons.dart';
import 'package:interview/search_screen.dart';

class home extends StatefulWidget {
  static const String routeName = "home";

  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController _name = TextEditingController();

  TextEditingController _age = TextEditingController();

  TextEditingController _nationalityid = TextEditingController();

  // @override
  // void initState() {
  //   _name = TextEditingController();
  //   _age = TextEditingController();
  //   _nationalityid = TextEditingController();
  //   ScrollController().dispose();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("my form"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const Text("enter your name"),
            SizedBox(
                child: TextFormField(
              controller: _name,
            )),
            const Text("enter your age"),
            SizedBox(
                child: TextFormField(
              controller: _age,
            )),
            const Text("enter your nationalityId"),
            SizedBox(
                child: TextFormField(
              controller: _nationalityid,
            )),
            ElevatedButton(
                onPressed: () {
                  int age = int.parse(_age.text);
                  int nationalityid = int.parse(_nationalityid.text);
                  PersonModel person = PersonModel(
                      name: _name.text, age: age, nationalityID: nationalityid);
                  firebaseFunctions.addpersons(person);
                  _age.clear();
                  _nationalityid.clear();
                  _name.clear();
                },
                child: const Text("add person")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AllPersonScreen.routeName);
                },
                child: const Text("get persons")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, SearchScreen.routeName);
            }, child: Text("Search for a person"))
          ],
        ),
      ),
    );
  }
}
