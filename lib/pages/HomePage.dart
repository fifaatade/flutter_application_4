import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/Playlists.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  int selectedIndex = 0;
  List<String> images = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
  ];
  final events = [
    {
      "speaker": "Atlant",
      "duree": "3:07",
      "subject": "Miyagi & Andy Panda",
      "avatar": "image1"
    },
    {
      "speaker": "Babel",
      "duree": "2:30",
      "subject": "Otnicka",
      "avatar": "img3"
    },
    {
      "speaker": "Survive",
      "duree": "5:02",
      "subject": "Lane 8, Channy Leaneagh",
      "avatar": "image1",
    },
    {
      "speaker": "Bass Drop",
      "duree": "2:30",
      "subject": "The Fullxaos",
      "avatar": "img3",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Hello, ",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: "Robert",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 24, 24, 24),
        child: Column(
          children: [
            Container(
              height: 270,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: ListView.builder(
                          reverse: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.only(right: 20.0),
                              // Set the selectedTileColor and tileColor based on the selectedIndex.
                              selected: index == selectedIndex,
                              // selectedTileColor: Colors.white,
                              ///  tileColor: Colors.black,

                              onTap: () {
                                // Update the selectedIndex when the ListTile is tapped.
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              title: Center(
                                child: RotatedBox(
                                  quarterTurns:
                                      3, // Rotate the text 270 degrees for vertical orientation.
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 2,
                                              color: index == selectedIndex
                                                  ? const Color.fromARGB(
                                                      255, 239, 83, 80)
                                                  : Colors.transparent)),
                                    ),
                                    child: Text(
                                      index == 0
                                          ? 'Top'
                                          : (index == 1 ? 'New' : 'Recomment'),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: index == selectedIndex
                                            ? const Color.fromARGB(
                                                211, 239, 83, 80)
                                            : Colors
                                                .grey, // Adjust font size as needed.
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )),
                  Expanded(
                      flex: 6,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Color.fromARGB(255, 24, 24, 24),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                                width: 250,
                              ),
                            ),
                          );
                        },
                      )),
                ],
              ),

            ),
           
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                
                child: ListView.builder(
                   
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    final avatar = event['avatar'];
                    final speaker = event['speaker'];
                    final duree = event['duree'];
                    final subject = event['subject'];

                    return InkWell(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Playlists(),
                        ))
                      },
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          
                          leading: Image.asset(
                            "assets/images/$avatar.jpg",
                          ),
                          title: Row(
                            children: [
                              
                              Text("$speaker", style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("$duree"),
                              )
                            ],
                          ),
                          subtitle: Text("$subject"),
                          trailing: 
                              Icon(Icons.graphic_eq),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: SalomonBottomBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text(""),
              selectedColor: Colors.red,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text(""),
              selectedColor: Colors.red,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text(""),
              selectedColor: Colors.red,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text(""),
              selectedColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
