import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<NewImage> getQuote() async {
  String url =
      'https://api.unsplash.com/photos/random/?client_id=Yny89_9txC2mbwLQ-yFx9bMBjvlq_7jvef22ffjTGVc';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return NewImage.fromJson(convert.jsonDecode(response.body));
  } else {
    throw Exception('Failed to load photo');
  }
}

class NewImage {
  final String imageUrl;
  final String photoName;
  final String author;

  NewImage({this.author, this.imageUrl, this.photoName});

  factory NewImage.fromJson(Map<String, dynamic> json) {
    return NewImage(
        author: json['user']['name'],
        imageUrl: json['urls']['small'],
        photoName: json['description']);
  }
}
