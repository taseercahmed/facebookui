import 'package:facebookui/Models/Storymodels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryBar extends StatefulWidget {
  @override
  State<StoryBar> createState() => _StoryBarState();
}

class _StoryBarState extends State<StoryBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 10.0,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 255,
              width: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 30.0),
                          height: 170,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image(
                              image: AssetImage("images/boy.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Add to Story",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 45,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle_outline_rounded,
                      ),
                      iconSize: 45.0,
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
            ),
            for (var i = 0; i < storymodel.length; i++) ...[
              Container(
                height: 250,
                width: 150,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          storymodel[i].ontap;
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(
                              storymodel[i].image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        left: 10.0,
                        child: Text(
                          storymodel[i].user,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
