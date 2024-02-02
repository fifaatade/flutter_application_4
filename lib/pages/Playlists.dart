import 'package:flutter/material.dart';


class Playlists extends StatelessWidget {
  const Playlists({super.key});


  @override
  Widget build(BuildContext context) {

      List<String> images = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
  ];
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Playlists"),
        centerTitle: true,
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.more_vert),
        )],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
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
                        width: 350,
                      ),
                    ),
                  );
                },
              )),
              Expanded(child: Container(child:
                Column(children: [
                  Text('Marmalade',style: TextStyle(fontSize:30,fontWeight: FontWeight.bold, color: Colors.black ),),
                  Text('Miyagi & Andy Panda, Mav-d', style: TextStyle(fontSize: 15,color: Colors.grey),)
                ],)
              ))
          ]),
        
        ),
      ),
      
    );
  }
}