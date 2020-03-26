import 'package:flutter/material.dart';
import './screens/image_detail.dart';
import './screens/gallery.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontFamily: 'Lato', fontSize: 24),
            ),
      ),
      routes: {
        '/': (ctx) => GalleryScreen(),
        ImageDetailScreen.routeName: (ctx) => ImageDetailScreen(),
      },
    );
  }
}
