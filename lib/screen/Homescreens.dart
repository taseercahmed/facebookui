import 'package:facebookui/CallPages/Pickupscreen.dart';
import 'package:facebookui/screen/ChatMessagingScreen.dart';
import 'package:facebookui/screen/ChatlayoutScreen.daty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  PageController? pagecontroller;
  @override
  void initState() {
    pagecontroller=PageController();
    super.initState();
  }
  int _page=0;
  void onpagechanged(int page){
    setState(() {
       _page=page;
    });
  }
  void navigationtaped(int page){
    pagecontroller!.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    double labfontsize=15;
    return Scaffold(

      body: PageView(

        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          ChatLayoutScreen(),

          Center(child:Text('contact secreen ')),
        ],
        onPageChanged: onpagechanged,
        controller:pagecontroller,

      ),
      bottomNavigationBar: Container(

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: CupertinoTabBar(

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(

            icon:Text('Chats',style: TextStyle(fontSize:labfontsize,
              color: (_page==0)?Colors.green:Colors.deepOrangeAccent ),),
               // icon: Icon(Icons.chat,color:
             // (_page==0)?Colors.lightBlue:Colors.blueGrey,),

              ),
              BottomNavigationBarItem(
                // title:Text('Call',style: TextStyle(fontSize:labfontsize,
                //     color: (_page==1)?Colors.green:Colors.deepOrangeAccent ),),
                icon: Icon(Icons.call,color:
                (_page==1)?Colors.lightBlue:Colors.blueGrey,),

              ),
              BottomNavigationBarItem(
                title:Text('Contact',style: TextStyle(fontSize:labfontsize,
                    color: (_page==2)?Colors.green:Colors.deepOrangeAccent ),),
                icon: Icon(Icons.contact_phone,color:
                (_page==2)?Colors.lightBlue:Colors.blueGrey,),

              )
            ],
            onTap: navigationtaped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
}
