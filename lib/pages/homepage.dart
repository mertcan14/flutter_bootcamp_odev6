import 'package:flutter/material.dart';
import 'package:prime_video_clone/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:prime_video_clone/components/bottom_navigation_bar.dart';
import 'package:prime_video_clone/model/movie_keepwatch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int secili_sayfa = 0;
  int currentPos = 0;
  var selectCategoryButton=1;
  List<String> listPaths = [
    "images/guc_yuzukleri.png",
    "images/night_sky.png",
    "images/reacher.png",
    "images/samaritan.png",
    "images/dayi_big.png",
  ];

  List<String> originalContent = [
    "images/guc_yuzukleri_small.png",
    "images/samaritan_small.png",
    "images/cosmic_love.png",
    "images/league_their_down.png",
    "images/invincible.png",
  ];

  List<String> top_ten = [
    "images/guc_yuzukleri_small.png",
    "images/samaritan_small.png",
    "images/the_boys.png",
    "images/reacher_small.png",
    "images/zaman_carki.png",
    "images/dayi.png",
    "images/the_terminal_list.png",
    "images/dilberay.png",
    "images/adanis.png",
    "images/yildizlarin_altinda.png",
  ];

  List<String> recommend = [
    "images/the_terror.png",
    "images/banana_fish.png",
    "images/sinirin_otesinde.png",
    "images/preacher.png",
    "images/fear_the_walking_dead.png",
    "images/mr_robot.png",
  ];

  List<MovieKeepWatch> keep_watch = [
    MovieKeepWatch(image: "images/good_omens.png", percent: 0.15),
    MovieKeepWatch(image: "images/the_boys.png", percent: 1.0),
  ];
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var height= size.height;
    var width = size.width;
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: mainColor,
      bottomNavigationBar: ButtomNavigationBarCustom(secili_sayfa: 0,),
      body: SingleChildScrollView(
        child: Padding(
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
              Row(
                children: [
                  Padding(
                    padding:const EdgeInsets.only(right: 8.0),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          selectCategoryButton=1;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: selectCategoryButton == 1 ? Colors.white : mainColor,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                      child: Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Tümü", style: TextStyle(color: selectCategoryButton != 1 ? Colors.white : mainColor, fontWeight: FontWeight.bold, fontSize: 15),),
                      ),
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(right: 8.0),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          selectCategoryButton=2;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: selectCategoryButton == 2 ? Colors.white : mainColor,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                      child: Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Filmler", style: TextStyle(color: selectCategoryButton != 2 ? Colors.white : mainColor, fontWeight: FontWeight.bold, fontSize: 15),),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        selectCategoryButton=3;
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: selectCategoryButton == 3 ? Colors.white : mainColor,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    child: Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("TV Dizileri", style: TextStyle(color: selectCategoryButton != 3 ? Colors.white : mainColor, fontWeight: FontWeight.bold, fontSize: 15),),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: width,
                height: height*2.4/10,
                child: CarouselSlider.builder(
                  itemCount: listPaths.length,
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      height: height*2.4/10,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPos = index;
                        });
                      }
                  ),
                  itemBuilder: (context,index, sayi){
                    return MyImageView(imgPath: listPaths[index]);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listPaths.map((url) {
                  int index=listPaths.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentPos == index
                          ? Color.fromRGBO(255, 255, 255, 0.9)
                          : Color.fromRGBO(255, 255, 255, 0.1),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*2/100, left: width/100),
                child: Row(
                  children: [
                    Text("Prime", style: TextStyle(color: Colors.blue, fontSize: width*5/100)),
                    Text(" - Amazon Orjinal ve Özel İçerikler >", style: TextStyle(color: Colors.white, fontSize: width*5/100),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height/100),
                child: CarouselSlider.builder(
                  itemCount: originalContent.length,
                  options: CarouselOptions(
                    padEnds: false,
                    enableInfiniteScroll: false,
                    initialPage: 1,
                    height: height*2.5/10,
                    viewportFraction: 0.35,
                    autoPlay: false,
                    disableCenter: true,
                    enlargeCenterPage: false,
                  ),
                  itemBuilder: (context,index, sayi){
                    return MyImageView(imgPath: originalContent[index]);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*2/100, left: width/100),
                child: Row(
                  children: [
                    Text("Türkiye İlk 10", style: TextStyle(color: Colors.blue, fontSize: width*5/100)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height/100),
                child: CarouselSlider.builder(
                  itemCount: top_ten.length,
                  options: CarouselOptions(
                    padEnds: false,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    height: height*2/10,
                    viewportFraction: 0.70,
                    autoPlay: false,
                  ),
                  itemBuilder: (context,index, sayi){
                    return MyImageViewForTop(imgPath: top_ten[index], index: (index+1).toString(),);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*2/100, left: width/100),
                child: Row(
                  children: [
                    Text("İzlemeye Devam Et", style: TextStyle(color: Colors.white, fontSize: width*5/100)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height/100),
                child: CarouselSlider.builder(
                  itemCount: keep_watch.length,
                  options: CarouselOptions(
                    padEnds: false,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    height: height*2/10,
                    viewportFraction: 0.65,
                    autoPlay: false,
                  ),
                  itemBuilder: (context,index, sayi){
                    return MyImageViewForKeepWatch(imgPath: keep_watch[index].image, value: keep_watch[index].percent);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*2/100, left: width/100),
                child: Row(
                  children: [
                    Text("Prime", style: TextStyle(color: Colors.blue, fontSize: width*5/100)),
                    Text(" - Önerilen Filmler >", style: TextStyle(color: Colors.white, fontSize: width*5/100),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height/100),
                child: CarouselSlider.builder(
                  itemCount: recommend.length,
                  options: CarouselOptions(
                    padEnds: false,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    height: height*2/10,
                    viewportFraction: 0.55,
                    autoPlay: false,
                  ),
                  itemBuilder: (context,index, sayi){
                    return MyImageViewForRecommend(imgPath: recommend[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyImageView extends StatelessWidget{

  String imgPath;

  MyImageView({required this.imgPath});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width*1.4/100),
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.fill,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(imgPath)
          ),
        ),
      )
    );
  }

}

class MyImageViewForTop extends StatelessWidget{

  String imgPath;
  String index;

  MyImageViewForTop({required this.imgPath, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children:[
        Container(
          child: SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.contain,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(imgPath, width: width*65/100,)
              ),
            ),
          )
        ),
        Padding(
          padding: EdgeInsets.only(left: width*2/100),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(index, style: TextStyle(fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Anton"),)
          ),
        )
      ],
    );
  }

}

class MyImageViewForKeepWatch extends StatelessWidget{

  String imgPath;
  double value;

  MyImageViewForKeepWatch({required this.imgPath, required this.value});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children:[
        Container(
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.contain,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(imgPath, width: width*65/100,)
                ),
              ),
            )
        ),
        Padding(
          padding: EdgeInsets.only(left: width*2/100),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: width*62/100,
                child: new LinearPercentIndicator(
                  width: width*60/100,
                  lineHeight: 10.0,
                  percent: value,
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue,
                ),
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height*2/100, left: width*6/100),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color.fromRGBO(229, 229, 229, 0.6),
              child: IconButton(
                onPressed: null,
                icon: Icon(Icons.play_arrow),
                disabledColor: Colors.white,
                iconSize: 25,
              ),
            ),
          ),
        )
      ],
    );
  }

}

class MyImageViewForRecommend extends StatelessWidget{

  String imgPath;

  MyImageViewForRecommend({required this.imgPath});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width*2/100),
        child: SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.fill,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(imgPath)
            ),
          ),
        )
    );
  }

}
