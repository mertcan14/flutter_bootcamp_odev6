import 'package:flutter/material.dart';
import 'package:prime_video_clone/colors.dart';
import 'package:prime_video_clone/pages/download_page.dart';
import 'package:prime_video_clone/pages/homepage.dart';
import 'package:prime_video_clone/pages/search_page.dart';

class ButtomNavigationBarCustom extends StatefulWidget {
  final int secili_sayfa;

  ButtomNavigationBarCustom({required this.secili_sayfa});

  @override
  _ButtomNavigationBarCustomState createState() => _ButtomNavigationBarCustomState();
}

class _ButtomNavigationBarCustomState extends State<ButtomNavigationBarCustom> {
  int secili_sayfa = 0;
  List<Widget> _children = [];


  void routesPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>_children[secili_sayfa]));
  }


  @override
  void initState() {
    secili_sayfa = widget.secili_sayfa;
    _children = [
      HomePage(),
      DownloadPage(),
      SearchPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: mainColor,
      currentIndex: secili_sayfa,
      onTap:(index) async{
        secili_sayfa = await index;
        routesPage();
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled, color: secili_sayfa == 0 ? Colors.white: Colors.white54,),
          title: new Text("Anasayfa", style: TextStyle( color: secili_sayfa == 0 ? Colors.white: Colors.white54),),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download_rounded, color: secili_sayfa == 1 ? Colors.white: Colors.white54,),
          title: new Text("İndirilenler", style: TextStyle( color: secili_sayfa == 1 ? Colors.white: Colors.white54)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: secili_sayfa == 2 ? Colors.white: Colors.white54,),
          title: new Text("Bul", style: TextStyle( color: secili_sayfa == 2 ? Colors.white: Colors.white54)),
        ),
      ],
    );
  }
}
