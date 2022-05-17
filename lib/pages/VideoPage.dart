import 'package:facebookui/Models/VideoModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPage extends StatefulWidget {
  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool isswitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Video",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  child: Switch(
                      // activeTrackColor: Colors.green,
                      //   activeColor: Colors.red,
                      value: isswitched,
                      onChanged: (value) {
                        setState(() {
                          isswitched = value;
                        });
                      }))
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.black26,
        ),
        Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(videomodel[index].userimg),
                                )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      videomodel[index].username,
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.black),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Followed",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.blueAccent),
                                      ),
                                    ),
                                  ],
                                ),
                                Wrap(
                                  spacing: 10.0,
                                  children: [
                                    Text(
                                      videomodel[index].usertime,
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    Icon(Icons.public),
                                  ],
                                )
                              ],
                            )),
                            IconButton(
                              iconSize: 19,
                              onPressed: () {},
                              icon: Icon(Icons.more_horiz_outlined),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                              ),
                              Text(
                                videomodel[index].usertitle,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              YoutubePlayerControllerProvider(
                                controller: YoutubePlayerController(
                                  initialVideoId:
                                      videomodel[index].videolink ?? "",
                                  params: YoutubePlayerParams(
                                    autoPlay: false,
                                    mute: true,
                                    showControls: true,
                                    showFullscreenButton: true,
                                  ),
                                ),
                                child: YoutubePlayerIFrame(
                                  aspectRatio: 16 / 9,
                                ),
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
                                  videomodel[index].userlike,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.message_outlined)),
                                Text(
                                  videomodel[index].usercomment,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.share_outlined)),
                                // Text("34",style: TextStyle(fontSize: 16,color:Colors.black ),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )))
      ],
    );
  }
}
