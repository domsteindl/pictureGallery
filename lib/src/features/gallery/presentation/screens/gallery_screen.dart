import 'package:flutter/material.dart';
import 'package:flutter_picture_gallery/src/features/gallery/domain/usecases/get_gallery_items.dart';
import 'package:flutter_picture_gallery/src/features/gallery/presentation/widgets/photo_tile.dart';
import '../../data/gallery_data.dart';

class GalleryScreen extends StatelessWidget {
  final GetGalleryItems getGalleryItems;

  GalleryScreen({super.key}) : getGalleryItems = GetGalleryItems();

  @override
  Widget build(BuildContext context) {
   final galleryItems = getGalleryItems.call();
    return Scaffold(
      body: GridView.builder(
        itemCount: galleryData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.82,
          crossAxisCount: (MediaQuery.of(context).size.width / 200).toInt(),
        ),
        itemBuilder: (context, index) {
           final item = galleryItems[index];
          return PhotoTile(item: item);
        },
      ),
    );
  }
}
