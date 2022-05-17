import 'package:flutter/material.dart';
class MessagingScreen extends StatefulWidget {
  const MessagingScreen({Key? key}) : super(key: key);

  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: SafeArea(

            child: Column(
              children: [
                Spacer(),
                Row(

                  children: [
                    IconButton(onPressed: (){

                    }, icon:Icon
                      ((Icons.emoji_emotions_outlined),color: Colors.grey,)),
                    SizedBox(width: size.width*0.014,),
                    Expanded(
                      child: TextField(
                        maxLines: null,
                        textInputAction: TextInputAction.done,

                        decoration: InputDecoration(
                          hintText: "Enter message",
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){

                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context, builder:
                          (builder)=>bottomsheet()

                      );

                    }, icon:Icon
                      ((Icons.attach_file),color: Colors.grey,)),
                    SizedBox(width: size.width*0.014,),
                    IconButton(onPressed: (){}, icon:Icon
                      ((Icons.mic),color: Colors.grey,)),

                  ],
                ),
                //emojipicker(),
              ],
            ),
          ),
       
      ),
    );
  }

  bottomsheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Iconcreationbutton(
              Icons.insert_drive_file_outlined,Colors.indigo,"Document"),
                  SizedBox(width: 40,),
                  Iconcreationbutton(
                      Icons.camera_alt_outlined,Colors.pink,"Camera"),
                  SizedBox(width: 40,),
                  Iconcreationbutton(
                      Icons.insert_photo,Colors.purple,"Gallery"),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Iconcreationbutton(
                      Icons.headset,Colors.orange,"Audio"),
                  SizedBox(width: 40,),
                  Iconcreationbutton(
                      Icons.location_pin,Colors.teal,"Location"),
                  SizedBox(width: 40,),
                  Iconcreationbutton(
                      Icons.person,Colors.blue,"Contact")

                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  Iconcreationbutton(IconData icon,Color color,String text,) {
    return InkWell(
      onTap: (){

      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child:Icon(icon,
            color: Colors.white,
            size: 29,
            ),
          ),
          SizedBox(height: 5,),
          Text(text,style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }

  // emojipicker() {
  //
  //   EmojiPicker(
  //       rows: 4,
  //       columns: 7,
  //       onEmojiSelected: (emoji,category){
  //     print("emoji");
  //   });
  // }
}
