import 'package:flutter/material.dart';
import './screens/gallery_screen.dart';
import './screens/image_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(ctx) => GalleryScreen(),
        ImageDetailScreen.routeName:(ctx) => ImageDetailScreen(),
      },
    );
  }
}