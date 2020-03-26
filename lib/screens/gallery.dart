import 'package:flutter/material.dart';
import '../models/data_request.dart';
import '../models/image.dart';
import '../widgets/image_item.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int page = 0;
  List<ImageData> _images = [];

  @override
  initState() {
    super.initState();
    _loadImages();
  }

  _loadImages() async {
    await Future.delayed(Duration());
    List<ImageData> images;
    print('getNew');
    images = await DataRequest.loadImages(++page);
    setState(() {
      _images.addAll(images);
    });
  }

  Future<ImageData> _loadImage(int index) async {
    if (index >= _images.length-2) {
      _loadImages();
    }
    print(index);
    return index < _images.length ? _images[index] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallery',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) => FutureBuilder(
          future: _loadImage(index),
          builder: (context, snapshot) => ImageItem(snapshot.data),
        ),
      ),
    );
  }
}
