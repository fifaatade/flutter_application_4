import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  List<Image> images = [
    Image.asset("assets/images/img1.jpg"),
    Image.asset("assets/images/img2.jpg"),
    Image.asset("assets/images/img3.jpg"),
    Image.asset("assets/images/img4.jpg"),
    Image.asset("assets/images/img5.jpg"),
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
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: "Robert",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Color.fromARGB(255, 24, 24, 24),
                    padding: EdgeInsets.all(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: images[index],
                    ),
                  );
                },
              )),

              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    final avatar = event['avatar'];
                    final speaker = event['speaker'];
                    final date = event['date'];
                    final subject = event['subject'];

                    return Card(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/$avatar.jpg",
                        ),
                        title: Text("$speaker ($date)"),
                        subtitle: Text("$subject"),
                        trailing: Icon(Icons.info),
                      ),
                    );
                  },
                ),
                )
              
        ],
        
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
