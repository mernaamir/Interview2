class PersonModel{
  String personID;
  String name;
 int nationalityID;
  int age;

  PersonModel({
    this.personID="",
    this.name="",
    required this.age,
   required this.nationalityID,
  });


  PersonModel.fromJson(Map<String,dynamic> json):this(
      personID: json['personID'],
      age: json['age'],
     name: json['name'],
      nationalityID:json['nationalityID'],

  );

  Map<String,dynamic> toJson(){
    return {
      "personID":personID,
      "name":name,
      "nationalityID":nationalityID,
      "age":age,

    };


}}