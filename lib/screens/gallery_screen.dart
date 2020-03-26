import 'package:flutter/material.dart';
import './image_detail_screen.dart';
import '../image.dart';

class GalleryScreen extends StatelessWidget {
  void goToImageDetail(BuildContext context,NewImage image)
  {
    Navigator.of(context).pushNamed(ImageDetailScreen.routeName,arguments: image);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FutureBuilder<NewImage>(
                future:
                    getQuote(), //sets the getQuote method as the expected Future
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //checks if the response returns valid data
                    return GridTile(
                        footer: snapshot.data.photoName == null
                            ? null
                            : GridTileBar(
                                backgroundColor: Colors.black12,
                                title: Text(
                                  snapshot.data.photoName,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  softWrap: true,
                                ),
                              ),
                        header: GridTileBar(
                          backgroundColor: Colors.black12,
                          title: Text(
                            snapshot.data.author,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                            softWrap: true,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () => goToImageDetail(context,snapshot.data),
                          child: Image.network(
                            snapshot.data.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ));
                  } else if (snapshot.hasError) {
                    //checks if the response throws an error
                    return GridTile(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey),
                        padding: EdgeInsets.all(35),
                        child: Text(
                          snapshot.error.toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            );
          }),
    );
  }
}
