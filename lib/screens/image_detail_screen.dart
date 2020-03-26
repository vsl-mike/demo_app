import '../image.dart';
import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
  static const String routeName = '/image_detail';
  @override
  Widget build(BuildContext context) {
    NewImage image = ModalRoute.of(context).settings.arguments as NewImage;
    return Scaffold(
      appBar: AppBar(
        title: Text(image.author),
      ),
      body: Container(
        width: double.infinity,
        child: Image.network(
          image.imageUrl,
        ),
      ),
    );
  }
}
