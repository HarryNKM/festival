import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;

import '../../modal/modal.dart';

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
  List<String> changeimg=[
    "assets/images/holi1.jpg",
    "assets/images/holi2.jpg",
    "assets/images/holi3.jpg",
    "assets/images/holi4.jpg",
  ];
  bool istxt = true;
  GlobalKey repaintkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    MaptoModel data = ModalRoute.of(context)!.settings.arguments as MaptoModel;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
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
            icon: Icon(Icons.person),
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
                padding: EdgeInsets.all(20),
                height: MediaQuery.sizeOf(context).width,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: bgcolor,
                ),
                alignment: Alignment.center,
                child: SelectableText(
                  "${data.wishes}",
                  style: TextStyle(color: txtcolor, fontSize: 18),
                ),
              ),
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
                  child: Text("Text"),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        istxt = false;
                      });
                    },
                    child: Text("BG"))
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
          ],
        ),
      ),
    );
  }
}
