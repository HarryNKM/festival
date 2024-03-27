
import 'package:flutter/material.dart';

import '../screen/edit/edit_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/info/info_screen.dart';
import '../screen/post/post_screen.dart';

Map<String, WidgetBuilder> app_routes = {
  '/': (context) => const HomeScreen(),
 'post': (context) => const PostScreen(),
  'edit': (context) => const EditPostScreen(),
  'info': (context) => const InfoScreen(),


};