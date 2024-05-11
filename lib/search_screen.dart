import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget{
  static const String routeName="searchscreen";
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List _allResults=[];
  List _resultList=[];
  final TextEditingController _searchcontreller=TextEditingController();

  @override
  void initState() {
    // getPersonStream();
    _searchcontreller.addListener(_onSearhChanged);
    super.initState();
  }
  _onSearhChanged( ){
// print(_searchcontreller.text);
searchResultList();
  }

  searchResultList(){
    var showResults=[];
    if(_searchcontreller.text !=""){
for(var personsnapshot in _allResults){
  var nationalityID=personsnapshot['nationalityID'];

}
    }else{
      showResults=List.from(_allResults);
    }
    setState(() {
      _resultList=showResults;

    });
  }


  getPersonStream()async{
    var data =await FirebaseFirestore.instance.collection('Persons').orderBy('name').get();
    setState(() {
      _allResults=data.docs;
    });
    searchResultList();
  }
  @override
  void dispose() {
    _searchcontreller.removeListener(_onSearhChanged);
    _searchcontreller.dispose();
    super.dispose();
  }
 @override
  void didChangeDependencies() {
    getPersonStream();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:CupertinoSearchTextField(
          controller: _searchcontreller,
        ),

      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Column(
          children: [
            Text(_resultList[index]['name'] ),
            Text(_resultList[index]['age'].toString() ),
            Text(_resultList[index]['nationalityID'].toString() )

          ],
        );
      },
      itemCount: _resultList.length,

      ),
    );
  }
}