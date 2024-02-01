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
      "speaker": "Lior chamla",
      "date": "13H à 13:30",
      "subject": "Le code legacy",
      "avatar": "image1"
    },
    {
      "speaker": "Damien Cavailles",
      "date": "17H30 à 18",
      "subject": "git blame --no-offense",
      "avatar": "image1"
    },
    {
      "speaker": "Defend Intelligence",
      "date": "18H à 18:30",
      "subject": "A la découverte des ia generatif",
      "avatar": "image1",
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
                                                .white, // Adjust font size as needed.
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
                  color: Color.fromARGB(235, 255, 255, 255),
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
                    final date = event['date'];
                    final subject = event['subject'];

                    return InkWell(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Playlists(),
                        ))
                      },
                      child: Card(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/$avatar.jpg",
                          ),
                          title: Text("$speaker ($date)"),
                          subtitle: Text("$subject"),
                          trailing: Icon(Icons.info),
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
