import 'package:flutter/material.dart';
import 'package:flutter_design_homework/colors.dart';
import 'package:flutter_design_homework/music.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        leading: Builder(
            builder: (BuildContext context){
              return IconButton(color: Colors.white,
                  icon : const Icon(Icons.man),
                  onPressed: (){
                    print("Page procsesing not be ready");
                  Scaffold.of(context).openDrawer();},
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip
                );
            }),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: IconButton(color: Colors.white,
              onPressed: (){
              print("Page procsesing not be ready");
            }, icon: const Text("Music",style: TextStyle(fontFamily: "goth"),),),
          ),
            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: IconButton(color: Colors.white,
                  onPressed: (){
                print("Page procsesing not be ready");
              }, icon: const Text("Podcast", style: TextStyle(fontFamily: "goth"),)),
            ),
          IconButton(color: Colors.white,
              onPressed: (){

          }, icon: Icon(Icons.search)),
        ],
      ),
      body: FutureBuilder<List<Music>>(
          future: musicLoad(),
          builder: (context,snapshot){
            if (snapshot.hasData){
                var musicList = snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black,
                        height: 200,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1/0.33),
                          itemCount: musicList!.length,
                          itemBuilder: (context,index){
                            var music = musicList[index];
                            return Card(color: card,
                              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: SizedBox(width: 50,height: 50,
                                            child: Image.asset("images/${music.music_image}")),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("${music.music_name}",style: TextStyle(fontFamily: "goth",color: Colors.white),),
                                        Text("${music.music_albume}", style: TextStyle(fontFamily: "goth",fontSize: 8),)
                                      ],
                                    ),
                                  ),
                                  Column(crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.play_circle_outline,size: 16,)
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: 420,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("MADE FOR YOU",style: TextStyle(fontSize: 24, fontFamily: "goth",color: Colors.white),),
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: 140,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: musicList.length,
                            itemBuilder: (context,index){
                              var music = musicList[index];
                              return SizedBox
                                (height: 80, width: 80,
                                child: Card(color: card,
                                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Image.asset("images/${music.music_image}"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${music.music_name}",style: TextStyle(fontFamily: "goth",fontSize: 12, color: Colors.white),),
                                            Text("${music.music_albume}",style: TextStyle(fontSize: 9,fontFamily: "goth"),),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      Container(
                        color: Colors.black,
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: musicList.length,
                            itemBuilder: (contex,index){
                              var music = musicList[index];
                              return SizedBox(height: 140,
                                child: Card(color: card,
                                  child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: SizedBox(height: 120, child: Image.asset("images/${music.music_image}")),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 3, top: 8),
                                        child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${music.music_albume}",style: TextStyle(fontSize: 20,fontFamily: "goth",color: Colors.white),),
                                            Text("${music.music_name}",style: TextStyle(fontFamily: "goth",fontSize: 15),),
                                            Text("${music.music_singer}",style: TextStyle(fontFamily: "goth",fontSize: 15),),
                                            IconButton(onPressed: (){
                                              print("Music add to libary");
                                            }, icon: Icon(Icons.add_circle_outline,color: Colors.black,))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
            }else {
              return const Center();
            }
          }),
        bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "Library")
        ],
        backgroundColor: Colors.black,
        selectedItemColor: touch,
        unselectedItemColor: card,
        ),
    );
  }
}
