import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utiles/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<String>> allimg = [
    g1.Diwalimage,
    g1.Ganeshimage,
    g1.holimage,
    g1.Republicimage,
    g1.Utrayanimage
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    g1.create();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Festivals",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: g1.Fname.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                Map m1 = g1.Fname[index];
                Navigator.pushNamed(context, 'post',
                    arguments: [m1, g1.Holi, g1.holimage]);
              } else if (index == 1) {
                Map m1 = g1.Fname[index];
                Navigator.pushNamed(context, 'post',
                    arguments: [m1, g1.Ganesh, g1.Ganeshimage]);
              } else if (index == 2) {
                Map m1 = g1.Fname[index];
                Navigator.pushNamed(context, 'post',
                    arguments: [m1, g1.Utrayan, g1.Utrayanimage]);
              } else if (index == 3) {
                Map m1 = g1.Fname[index];
                Navigator.pushNamed(context, 'post',
                    arguments: [m1, g1.Diwali, g1.Diwalimage]);
              } else if (index == 4) {
                Map m1 = g1.Fname[index];
                Navigator.pushNamed(context, 'post',
                    arguments: [m1, g1.Republic, g1.Republicimage]);
              }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.sizeOf(context).width,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Image.asset(
                "${g1.Fname[index]['image']}",
              ),
            ),
          );
        },
      ),
    );
  }
}
