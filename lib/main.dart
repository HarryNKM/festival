import 'package:festival_post_app/utiles/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: "edu"),
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),
  );
}