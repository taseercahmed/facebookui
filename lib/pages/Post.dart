import 'package:facebookui/Models/NewPostModel.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final _scafold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (var i = 0; i < newmodel.length; i++) ...[
            Row(
              children: [
                IconButton(
                  iconSize: 50.0,
                  onPressed: () {},
                  icon: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(newmodel[i].userimg),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newmodel[i].username,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Wrap(
                        spacing: 10.0,
                        children: [
                          Text(
                            newmodel[i].usertime,
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.public),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz_outlined))
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      newmodel[i].usertitle,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                  Image(
                    width: 400,
                    fit: BoxFit.cover,
                    image: AssetImage(newmodel[i].userdownimg),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.thumb_up_alt_outlined)),
                    Text(
                      newmodel[i].userlike,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.message_outlined)),
                    Text(
                      newmodel[i].usercomment,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.share_outlined)),
                    // Text("34",style: TextStyle(fontSize: 16,color:Colors.black ),),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );

    throw UnimplementedError();
  }
}
