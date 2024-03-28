import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utiles/global.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtadd = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool iscontact = true;

  String path = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Business Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.sizeOf(context).width * 0.90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          path.isEmpty?
                          const CircleAvatar(
                            maxRadius: 50,
                            child: Icon(Icons.person,size: 50,color: Colors.grey,),
                          ):
                          CircleAvatar(
                            maxRadius: 50,
                            backgroundImage: FileImage(File("${path}"),),
                          ),
                          InkWell(
                            onTap: () async {
                              ImagePicker picker = ImagePicker();
                              XFile? image = await picker.pickImage(source: ImageSource.gallery);
                              setState(() {
                                path=image!.path;
                                g1.img=image.path;
                              });
                            },
                            child: const CircleAvatar(
                              maxRadius: 15,
                              backgroundColor: Colors.pinkAccent,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                         prefixIcon: Icon(Icons.person_2_outlined),
                            border: OutlineInputBorder(),
                            hintText: "Name",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Rquired Field";
                          }
                        },
                        controller: txtname,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                           border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.phone_android),
                            hintText: "phone",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Rquired Field";
                          } else if (value.length != 10) {
                            return "10 digits Required";
                          }
                        },
                        controller: txtphone,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        maxLines: 3,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                           border: OutlineInputBorder(),
                            prefixIcon : Icon(Icons.email_outlined),
                            hintText: "email",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Rquired Field";
                          } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Invaild Email";
                          }
                        },
                        controller: txtemail,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                     ElevatedButton(onPressed: () {
          
                       if(formkey.currentState!.validate())
                       {
                         g1.name=txtname.text;
                         g1.phone=txtphone.text;
                         g1.email=txtemail.text;
                         formkey.currentState!.save();
                       }
                     }, child: Icon(Icons.save))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}