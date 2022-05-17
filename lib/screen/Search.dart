
import 'package:facebookui/User/Profile.dart';
import 'package:facebookui/User/Userdetailmodel.dart';
import 'package:facebookui/resources/Firebase_repository.dart';
import 'package:facebookui/screen/ChatMessagingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  User? user1=FirebaseAuth.instance.currentUser;
  Firebaserepository _repositary=Firebaserepository();
  List<UserDetailmodel>?userlist;
  String query='';
  TextEditingController searchcontroller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repositary.getCurrentUser().then((user) {
      _repositary.fetchallUser(user1!).then((List<Users>list) {


      });
    });
  }
SearchAppbar(BuildContext context){
    return NewGradientAppBar(
        gradient: LinearGradient(colors: [Colors.blueGrey,Colors.red,Colors.green]),
      leading: IconButton(
        tooltip: 'Back',
        icon: Icon(Icons.arrow_back,color: Colors.white,),
        onPressed: (){
         Navigator.pop(context);
        },
      ),
      elevation: 0,
      bottom: PreferredSize(preferredSize: const Size.fromHeight(kToolbarHeight+20),
      child: Padding(
        padding: EdgeInsets.only(left: 30),
        child: TextField(
          controller: searchcontroller,
          decoration: InputDecoration(
            suffixIcon: IconButton(icon:Icon(Icons.close),onPressed: (){
            WidgetsBinding.instance!.addPostFrameCallback((timeStamp)=>searchcontroller.clear());
            },),
            hintText: 'Search',
              border: InputBorder.none
          ),
          onChanged: (val){
            query=val;
          },
          cursorColor: Colors.blueGrey,
          autofocus: true,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 35,

          ),
        ),
      ),
      ),
    );
}
  buildsegestion(String query){
  final  List<UserDetailmodel>segestionlist=query.isEmpty?[]
        :userlist!.where((UserDetailmodel user){
          String getusername=user.username!.toLowerCase();
          String _getname=user.name!.toLowerCase();
          String _query=query.toLowerCase();
          bool matchusername=getusername.contains(_query);
          bool matchesname=_getname.contains(_query);
          return (matchusername||matchesname);
    }).toList();
  ListView.builder(
      itemCount: segestionlist.length,
      itemBuilder:((context,index){
      //  UserDetailmodel searcheduser=UserDetailmodel(segestionlist[index].name, segestionlist[index].uid,
          //  segestionlist[index].photourl, segestionlist[index].name,
          //segestionlist[index].name, segestionlist[index].state, segestionlist[index].username,);
        return ListTile(
       leading: CircleAvatar(
         backgroundImage: NetworkImage(searcheduser.photourl.toString()),
         backgroundColor: Colors.grey,

       ),
          title: Text(searcheduser.username.toString()),
          subtitle: Text(searcheduser.name.toString()),
            onTap: (){
         Navigator.push(context, MaterialPageRoute(builder:
             (context)=>ChatMessagingScreen(

           receiver:searcheduser,

         ),


         ));
            },

        );
      }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppbar(context),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: buildsegestion(query),
        ),
      ),
    );
  }
}
