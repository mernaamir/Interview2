import 'package:flutter/material.dart';
import 'package:interview/firebase_functions.dart';
import 'package:interview/person_model.dart';
import 'persons.dart';

class EditPersonScreen extends StatelessWidget {
  static const String routeName = "editperson";
  EditPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var person = ModalRoute.of(context)!.settings.arguments as PersonModel;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit person"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Edit Name "),
              SizedBox(
                  child: TextFormField(
                initialValue: person.name,
                onChanged: (value) {
                  person.name = value;
                },
              )),
              Text("Edit Age "),
              SizedBox(
                  child: TextFormField(
                initialValue: person.age.toString(),
                onChanged: (value) {
                  person.age = int.parse(value);
                },
              )),
              Text("Edit Nationality "),
              SizedBox(
                  child: TextFormField(
                initialValue: person.nationalityID.toString(),
                onChanged: (value) {
                  person.nationalityID = int.parse(value);
                },
              )),
              ElevatedButton(
                  onPressed: () async {
                    await firebaseFunctions.updateperson(person);
                    Navigator.pushNamed(
                      context,
                      AllPersonScreen.routeName,
                    );
                  },
                  child: Text("Save Changes"))
            ],
          ),
        ));
  }
}
