import 'package:flutter/material.dart';
import '../../modal/modal.dart';
import '../../utiles/global.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    Map m1 = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "${m1['festival']} ",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: g1.festivaldetail.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                MaptoModel data = g1.festivaldetail[index];
                Navigator.pushNamed(context, 'edit', arguments: data);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: 150,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${g1.festivaldetail[index].wishes}",
                  style: TextStyle(color: Colors.white, fontSize: 20,overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
