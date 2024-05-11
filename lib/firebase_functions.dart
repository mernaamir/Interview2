import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interview/person_model.dart';

class firebaseFunctions{
  static CollectionReference <PersonModel> getPersonsCollection()
  {
    return FirebaseFirestore.instance.collection("Persons").withConverter<PersonModel>
      (fromFirestore: (snapshot, _) {
      return PersonModel.fromJson(snapshot.data()!);
    }, toFirestore: (value,_){
      return value.toJson();
    });
  }
  static void addpersons(PersonModel person)
  {
    var collection=getPersonsCollection();
    var docRef=collection.doc();
    person.personID=docRef.id;
    docRef.set(person);
  }


  static Future<QuerySnapshot<PersonModel>> getpersons(){
    return  getPersonsCollection().get();
  }

  static Future<void> deleteperson(String id){
    return getPersonsCollection().doc(id).delete();
  }

static Future<void>updateperson(PersonModel person){
    return getPersonsCollection().doc(person.personID).update(person.toJson());
}


}