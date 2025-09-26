import 'package:flutter/material.dart';

import 'package:flutter_picture_gallery/src/features/gallery/domain/entities/gallery_item_entity.dart';

class PhotoTile extends StatelessWidget {
  final GalleryItemEntity item;

  const PhotoTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20),
          child: Card(
            clipBehavior: Clip.hardEdge,
            shape: CircleBorder(eccentricity: 1, side: BorderSide(width: 3)),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/photoDetail',
                        arguments: item,
                      );
                    },
                    child: Image.asset(item.imagePath, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(item.imageTitle),
      ],
    );
  }
}
