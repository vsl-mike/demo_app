import '../models/image.dart';
import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
  static const String routeName = '/image_detail';
  @override
  Widget build(BuildContext context) {
    ImageData image = ModalRoute.of(context).settings.arguments as ImageData;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(image.getUserName(),style:Theme.of(context).textTheme.title),
      ),
      body: Container(
        width: double.infinity,
        child: Image.network(
          image.getSmallUrl(),
        ),
      ),
    );
  }
}
