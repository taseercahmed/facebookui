import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebookui/Constant/String.dart';


import 'Call Model.dart';
//call method class contain all backend of call...
class CallMethod{
  final CollectionReference callcollection=FirebaseFirestore.instance.collection(call_collection);

  Future<bool>makecall({required Call call})async{
    try{
      call.hasdiallled=true;
      Map<String,dynamic>hasdialledmap=call.tomap(call);
      call.hasdiallled=false;
      Map<String,dynamic>hasnotdialledmap=call.tomap(call);
      await callcollection.doc(call.callerid).set(hasdialledmap);
      await callcollection.doc(call.receiverid).set(hasnotdialledmap);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }
  Future<bool>endcall({required Call call})async{
   try{

     await callcollection.doc(call.callerid).delete();
     await callcollection.doc(call.receiverid).delete();
     return true;
   }catch(e){
     print(e);
     return false;
   }

  }
}