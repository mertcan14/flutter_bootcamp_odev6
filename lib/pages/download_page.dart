import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prime_video_clone/colors.dart';
import 'package:prime_video_clone/components/bottom_navigation_bar.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height= size.height;
    var width = size.width;
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: mainColor,
      bottomNavigationBar: ButtomNavigationBarCustom(secili_sayfa: 1,),
      body: Padding(
        padding: EdgeInsets.only(top: padding.top),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*2/100),
              child: Container(
                height: height*6/100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("images/prime_video.png", width: 80,),
                    Image.asset("images/person.png", height: 40,),
                  ],
                ),
              ),
            ),
            Container(
              height: height - (height*6/100) - kToolbarHeight -  padding.top - padding.bottom,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No videos downloaded", style: TextStyle(color: Colors.white, fontSize: 24),),
                  Padding(
                    padding: EdgeInsets.only(top:height*2/100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Auto Downloades: Açık", style: TextStyle(color: Colors.white, fontSize: 16),),
                        Text("   Manage", style: TextStyle(color: Colors.blue, fontSize: 16),),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
