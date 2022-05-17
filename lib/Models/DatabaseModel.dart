import 'package:cloud_firestore/cloud_firestore.dart';

class Databasemodel{
  final String uid;
  Databasemodel({required this.uid});
  final CollectionReference brewreference=FirebaseFirestore.instance.collection("user");

  Future Updatauserdata(String name,String sugar,int strength)async{
    return await brewreference.doc(uid).set(
   {
     'name':name,
     'sugar':sugar,
     'strength':strength,
   }
    );
  }
}