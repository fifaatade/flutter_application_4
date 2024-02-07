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
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios)),
        title: Text("Playlists"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          height: 350,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              ...images
                                  .map((e) => Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 10.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(
                                                          130, 0, 0, 0)
                                                      .withOpacity(0.3),
                                                  blurRadius: 10,
                                                  offset: Offset(2, 2),
                                                  spreadRadius: 12,
                                                  blurStyle: BlurStyle.inner,
                                                ),
                                              ],
                                            ),
                                            child: Image.asset(
                                              e,
                                              fit: BoxFit.cover,
                                              width: 250,
                                              height: 250,
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ]),
                          ))),
                ],
              ),
            ),
            Container(
                child: Column(
              children: [
                Text(
                  'Marmalade',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'Miyagi & Andy Panda, Mav-d',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(
                  height: 50,
                ),
                Icon(Icons.graphic_eq_rounded),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10:00',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11),
                        ),
                        Text(
                          '  3:00',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11),
                        )
                      ]),
                )
              ],
            ))
          ]),
        ),
      ),
    );
  }
}
