import 'package:flutter/material.dart';
import '../models/image.dart';
import '../screens/image_detail.dart';

class ImageItem extends StatelessWidget {
  final ImageData image;
  const ImageItem(this.image);
  void goToImageDetail(BuildContext context, ImageData image) {
    Navigator.of(context).pushNamed(
      ImageDetailScreen.routeName,
      arguments: image,
    );
  }

  @override
  Widget build(BuildContext context) => image != null
      ? ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GridTile(
            footer: image.getDescription() != null
                ? GridTileBar(
                    backgroundColor: Colors.black12,
                    title: Text(
                      image.getDescription(),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  )
                : null,
            header: GridTileBar(
              backgroundColor: Colors.black12,
              title: Text(
                image.getUserName(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                softWrap: true,
              ),
            ),
            child: GestureDetector(
              onTap: () => goToImageDetail(context, image),
              child: Image.network(
                image.getSmallUrl(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      : SizedBox();
}
