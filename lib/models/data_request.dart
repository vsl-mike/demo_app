import 'dart:convert';
import 'dart:io';
import '../models/image.dart';

class DataRequest {
  static const String key = 'Yny89_9txC2mbwLQ-yFx9bMBjvlq_7jvef22ffjTGVc';
  static Future<List> loadImages(int page) async {
    String url = 'https://api.unsplash.com/photos?page=' + page.toString() + '';
    var data;
    HttpClientRequest request = await HttpClient().getUrl(Uri.parse(url));
    request.headers.add('Authorization', 'Client-ID ' + key + '');
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String json = await response.transform(utf8.decoder).join();
      data = jsonDecode(json);
    } else
      data = [];
    List<ImageData> images = List<ImageData>.generate(
      data.length,
      (index) {
        return ImageData(data[index]);
      },
    );
    return images;
  }
}
