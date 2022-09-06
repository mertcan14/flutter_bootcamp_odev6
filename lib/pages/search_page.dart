import 'package:flutter/material.dart';
import 'package:prime_video_clone/colors.dart';
import 'package:prime_video_clone/components/bottom_navigation_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  var turler = [
    "Aksiyon ve macera",
    "Anime",
    "Komedi",
    "Belgesel",
    "Dram",
    "Fantastik"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height= size.height;
    var width = size.width;
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: mainColor,
      bottomNavigationBar: ButtomNavigationBarCustom(secili_sayfa: 2,),
      body: Padding(
        padding: EdgeInsets.only(top: padding.top),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*2/100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("images/prime_video.png", width: 80,),
                  Image.asset("images/person.png", height: 40,),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height/100, horizontal: width/100),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                  filled: true,
                  fillColor: Colors.white
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height/100, horizontal: width/100),
                child: Text("Türler", style: TextStyle(color: Colors.white, fontSize: 18),),
              )
            ),
            SizedBox(
              width: width,
              height: height*27/100,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4/1,
                ),
                itemCount: turler.length,
                itemBuilder: (context, index){
                  return Card(
                    color: Color(0xff1f2b37),
                    child: Center(child: Text(turler[index], style: TextStyle(color: Colors.white, fontSize: 16),)),
                  );
                },
              ),
            ),
            TextButton(
              onPressed: (){},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width*2/100, vertical: height/200),
                child: Text("Daha Fazlasını Gör", style: TextStyle(color: Colors.white),),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff6c757d)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height*2/100),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: height/100, horizontal: width/100),
                    child: Text("Seçme Koleksiyonlar", style: TextStyle(color: Colors.white, fontSize: 18),),
                  )
              ),
            ),
            Divider(
              color: Color(0xff1f2b37),
              thickness: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Avrupa'da üretilmişler", style: TextStyle(color: Colors.white),),
                Icon(Icons.keyboard_arrow_right, color: Colors.white,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
