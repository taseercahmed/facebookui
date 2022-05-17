import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videomodell {
  final String userimg;
  final String username;
  final String usertime;
  final String usertitle;
  final String userlike;
  final String userdownimg;
  final String usercomment;
  final String usersharing;
  final String? videolink;

  Videomodell(
      this.userimg,
      this.username,
      this.usertime,
      this.usertitle,
      this.userlike,
      this.userdownimg,
      this.usercomment,
      this.usersharing,
      this.videolink);
}

List<Videomodell> videomodel = [
  Videomodell(
    "images/jawad.jpg",
    "Jawad Ali",
    "20 min ago",
    "This is beautiful quotes Hopefully you will enjoy and impose it on you life",
    "14",
    "images/natural.jpg",
    "16",
    "40",
    YoutubePlayer.convertUrlToId("https://fb.watch/9C60WDNlnd/"),
  ),
  Videomodell(
    "images/girl.jpg",
    "Jawad Ali",
    "20 min ago",
    "This is beautiful quotes Hopefully you will enjoy and impose it on you life",
    "14",
    "images/girl.jpg",
    "16",
    "40",
    YoutubePlayer.convertUrlToId("https://fb.watch/9C60WDNlnd/"),
  ),
  Videomodell(
    "images/videoblocks.png",
    "Jawad Ali",
    "20 min ago",
    "How are you? guys",
    "14",
    "images/videoblocks.png",
    "16",
    "40",
    YoutubePlayer.convertUrlToId("https://fb.watch/9C60WDNlnd/"),
  ),
  Videomodell(
    "images/jawad.jpg",
    "Jawad Ali",
    "20 min ago",
    "This is beautiful quotes Hopefully you will enjoy and impose it on you life",
    "14",
    "images/show.jpg",
    "16",
    "40",
    YoutubePlayer.convertUrlToId("https://fb.watch/9C60WDNlnd/"),
  ),
];
