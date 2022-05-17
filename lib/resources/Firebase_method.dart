//A map is simply a data structure whic hold the data using  key value pair.
// curley brace to define a map,inside a map we provide a key in double color
// and also provide value to that key  such as firebasefire.instance .collection(take string ).
// doc.set({'name':'jawad'});name is key and jawad is value of that key...
//Pageview is a widget which creates a scrollable list
// that works page by page from an explicit list of widgets.
// In simple word it maps a list of widgets to multiple page and you can actually slighte that page

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebookui/Models/user.dart';
import 'package:facebookui/User/Profile.dart';
import 'package:facebookui/User/Userdetailmodel.dart';
import 'package:facebookui/utils/Utilties.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class FirebaseMethod{
   UserDetailmodel? users;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  GoogleSignIn _googleSignIn=GoogleSignIn();

  Future<FirebaseAuth>getCurrentUser()async {
    FirebaseAuth currentuser;
    currentuser=(await _auth.currentUser) as FirebaseAuth;
    return currentuser;
  }
  Future<User>signIn()async{
 GoogleSignInAccount? signInAccount=await _googleSignIn.signIn();
 //signin this function is responsible for  showing a google signinblock on a screen and we wait for user reponse.
  GoogleSignInAuthentication _signInAuthentication = await signInAccount!.authentication;

    final AuthCredential credential=GoogleAuthProvider.credential(
      accessToken: _signInAuthentication.accessToken,
      idToken: _signInAuthentication.idToken,
    );
      Future<User> user=  _auth.signInWithCredential(credential) as Future<User>;
      print('jckdv'+user.toString());
      return user;
  }

  Future<bool> authenticateuser(user)async{
    QuerySnapshot result=await firestore.collection('userss')
        .where('email',isEqualTo:user.email).get();
    final List<DocumentSnapshot>docs=result.docs;
    //if user is registered then length of list > 0or else less than 0
    return docs.length==0?true:false;


  }
  Future<void>addDatatoDb(User currentuser)async{
    String username=Utils.getUsername(currentuser.email);
   users=UserDetailmodel(uid:currentuser.uid, name:currentuser.displayName , email: currentuser.email,
        username: username, status:null, state:null, profilePhoto: currentuser.photoURL);

    // firestore
    //     .collection("users")
    //     .doc(currentuser.uid)
    //     .set(users!.toMap(user));
  }

}

