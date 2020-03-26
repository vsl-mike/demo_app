class ImageData {
  Map<String, dynamic> data;
  ImageData(this.data);
  String getDescription() {
    return data['description'];
  }

  String getUserName() {
    return data['user']['username'];
  }

  String getSmallUrl() {
    return data['urls']['small'];
  }
}
