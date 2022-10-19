import 'package:flutter/material.dart';
import 'package:spotify/SongListPage.dart';
import 'package:spotify/logic/models/categories.dart';
import 'package:spotify/logic/operations/categoryOperations.dart';
import 'package:spotify/logic/models/artists.dart';
import 'package:spotify/logic/operations/artistOperation.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // const Home({Key? key}) : super(key: key);
  var hour = DateTime.now().hour;
  String greetings="";

  Widget CreateOneCategory(Category cat){
    return Container(
      color: Colors.blueGrey,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => SongList(1,cat.name)));
          },
         child:Row(
            children: [
              Image.asset(
                cat.image,
                fit: BoxFit.cover,
                height: 70,
                width:50
              ),
              Padding(
                  padding: EdgeInsets.only(left:10),
                  child: Text(
                      cat.name,
                      style: TextStyle(
                          color: Colors.white
                      )
                  ),
              )
            ],
        )
        )
    );
  }

  List<Widget> createCategoryList(){
    List<Category>list = CategoryOperations.getAllCategory();
    List<Widget> widget_list = list.map((Category i)=>CreateOneCategory(i)).toList();
    return widget_list;
  }

  Widget makeGrid(){
    return Container(
      height: 300,
      padding: EdgeInsets.all(10),
      child:GridView.count(
        childAspectRatio: 5/2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: createCategoryList(),
        crossAxisCount: 2,
      )
    );
  }

  Widget createCard(Artists artist){
    return Container(
        padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => SongList(2,artist.name)));
          },
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[

                Image.asset(
                  artist.image,
                  height:120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    artist.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )
                )
              ]
          )
        )
    );
  }

  Widget makeHorizontal(){
    List<Artists>list = ArtistOperations.getAllArtist();
    return Padding(
        padding: EdgeInsets.only(left: 1),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.only(left: 10),
              child:Text(
                  "Artists",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )
              )
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 300,
              padding: EdgeInsets.only(top: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return createCard(list[index]);
                },
                itemCount: list.length,
            )
            )
          ],

        )
    );
  }

  @override
  initState() {
    super.initState();
    if(hour>=4 && hour<12){
      greetings = "Good Morning";
    }
    else if(hour>=12 && hour<16){
      greetings = "Good Afternoon";
    }
    else if(hour>=16 && hour<20){
      greetings = "Good Evening";
    }
    else{
      greetings="Good Night";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child:Container(
          child: Column(
            children: [
              SizedBox(
                height:10
              ),
              AppBar(
                title: Text(greetings),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: 15,
              ),
              makeGrid(),
              makeHorizontal(),



            ],
          ),
          decoration: BoxDecoration(
            gradient:LinearGradient(
              colors: [
                Colors.blueGrey,
                Colors.black
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),

        )
      )
    );
  }
}



