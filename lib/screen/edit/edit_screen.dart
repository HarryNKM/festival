import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;

class EditPostScreen extends StatefulWidget {
  const EditPostScreen({super.key});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  List<Color> changecolor = [Colors.black, Colors.white, ...Colors.primaries];
  List<Color> changebg = [Colors.black, Colors.white, ...Colors.accents];
  Color txtcolor = Colors.black;
  Color bgcolor = Colors.grey;
  String? img = "";
  List<String> changeimg = [
    "assets/images/holi1.jpg",
    "assets/images/holi2.jpg",
    "assets/images/holi3.jpg",
    "assets/images/holi4.jpg",
  ];
  bool istxt = true;
  bool isImg = false;

  GlobalKey repaintkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List data = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Edit post",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'info');
            },
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () async {
              RenderRepaintBoundary boundry = repaintkey.currentContext!
                  .findRenderObject() as RenderRepaintBoundary;
              ui.Image image = await boundry.toImage();
              ByteData? bytedata =
                  await image.toByteData(format: ui.ImageByteFormat.png);
              Uint8List data = bytedata!.buffer.asUint8List();

              await ImageGallerySaver.saveImage(data);

              Directory dir = await getTemporaryDirectory();
              await Share.shareXFiles(
                [
                  XFile(dir.path),
                ],
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Image Shared"),
                  backgroundColor: Colors.pinkAccent,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              RenderRepaintBoundary boundry = repaintkey.currentContext!
                  .findRenderObject() as RenderRepaintBoundary;
              ui.Image image = await boundry.toImage();
              ByteData? bytedata =
                  await image.toByteData(format: ui.ImageByteFormat.png);
              Uint8List data = bytedata!.buffer.asUint8List();

              await ImageGallerySaver.saveImage(data);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Image Saved"),
                  backgroundColor: Colors.pinkAccent,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(
              Icons.download,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            RepaintBoundary(
              key: repaintkey,
              child: Container(
                  height: MediaQuery.sizeOf(context).width,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: bgcolor,
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Visibility(
                        visible: isImg,
                        child: Image.asset(
                          img!,
                          fit: BoxFit.cover,
                          height: MediaQuery.sizeOf(context).width,
                          width: MediaQuery.sizeOf(context).width,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${data[1]['wishes']}",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      istxt = true;
                    });
                  },
                  child: const Text("Text"),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        istxt = false;
                      });
                    },
                    child: const Text("BG"))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //text
            Visibility(
              visible: istxt,
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: changecolor.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(
                          () {
                            txtcolor = changecolor[index];
                          },
                        );
                      },
                      child: Container(
                        width: 50,
                        margin: const EdgeInsets.only(
                          right: 5,
                        ),
                        decoration: BoxDecoration(
                          color: changecolor[index],
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            //background
            Visibility(
              visible: !istxt,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemCount: changebg.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(
                                () {
                                  bgcolor = changebg[index];
                                  isImg=false;
                                },
                              );
                            },
                            child: Container(
                              width: 50,
                              margin: const EdgeInsets.only(
                                right: 5,
                              ),
                              decoration: BoxDecoration(
                                color: changebg[index],
                                border: Border.all(
                                  width: 2,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !istxt,
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: changeimg.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          isImg = true;
                          img = changeimg[index];
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 80,
                        margin: EdgeInsets.all(5),
                        child: Image.asset(
                          changeimg[index],
                          fit: BoxFit.fill,
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
    );
  }
}
