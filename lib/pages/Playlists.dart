import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/rendering.dart';


class Playlists extends StatefulWidget {
  const Playlists({super.key});

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/img1.jpg",
      "assets/images/img2.jpg",
      "assets/images/img3.jpg",
      "assets/images/img4.jpg",
      "assets/images/img5.jpg",
    ];

    final autoSizeGroup = AutoSizeGroup();
    var _bottomNavIndex = 0; //default index of a first screen

    late AnimationController _fabAnimationController;
    late AnimationController _borderRadiusAnimationController;
    late Animation<double> fabAnimation;
    late Animation<double> borderRadiusAnimation;
    late CurvedAnimation fabCurve;
    late CurvedAnimation borderRadiusCurve;
    late AnimationController _hideBottomBarAnimationController;

    final iconList = <IconData>[
      Icons.replay,
      Icons.fast_rewind,
      Icons.fast_forward,
      Icons.favorite,
    ];
    @override
    void initState() {
      super.initState();

      _fabAnimationController = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this,
      );
      _borderRadiusAnimationController = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this,
      );
      fabCurve = CurvedAnimation(
        parent: _fabAnimationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      );
      borderRadiusCurve = CurvedAnimation(
        parent: _borderRadiusAnimationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      );

      fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
      borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
        borderRadiusCurve,
      );

      _hideBottomBarAnimationController = AnimationController(
        duration: Duration(milliseconds: 200),
        vsync: this,
      );

      Future.delayed(
        Duration(seconds: 1),
        () => _fabAnimationController.forward(),
      );
      Future.delayed(
        Duration(seconds: 1),
        () => _borderRadiusAnimationController.forward(),
      );
    }
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
                          height: 400,
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
                                                      130, 0, 0, 0),
                                                  blurRadius: 40,
                                                  offset: Offset(10, 40),
                                                  spreadRadius: 40,
                                                  blurStyle: BlurStyle.inner,
                                                ),
                                              ],
                                            ),
                                            child: Image.asset(
                                              e,
                                              fit: BoxFit.cover,
                                              width: 370,
                                              height: 400,
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
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Marmalade',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'Miyagi & Andy Panda, Mav-d',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Image.asset(
                    "assets/images/equalizer.png",
                    height: 100,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '01:08',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11),
                        ),
                        Text(
                          '04:15',
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
          shape: CircleBorder(),       
          child: Icon(
          Icons.pause,
          color: Colors.white,
        ),
        onPressed: () {
          _fabAnimationController.reset();
          _borderRadiusAnimationController.reset();
          _borderRadiusAnimationController.forward();
          _fabAnimationController.forward();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 90,
        backgroundColor: Colors.black,
        icons: iconList,
        activeColor: Colors.red,
        inactiveColor: Colors.white,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        
        ),
    );
  }
}
