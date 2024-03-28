import 'package:flutter/material.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  @override
  Widget build(BuildContext context) {
    List list = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "${list[0]['festival']} ",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: list[1].length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                List data =list[1][index];
                Navigator.pushNamed(context, 'edit',
                    arguments: [data, list[2]]);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                height: 150,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${list[1][index]['wishes']}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
