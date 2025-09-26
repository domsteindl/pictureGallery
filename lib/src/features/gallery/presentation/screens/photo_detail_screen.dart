import 'package:flutter/material.dart';
import 'package:flutter_picture_gallery/src/features/gallery/domain/entities/gallery_item_entity.dart';

class PhotoDetailsScreen extends StatelessWidget {

  const PhotoDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GalleryItemEntity item =
        ModalRoute.of(context)!.settings.arguments as GalleryItemEntity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 94, 24, 19),
        title: Text("Details", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.asset(item.imagePath, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.imageTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    item.imageDate,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(item.imageDescription),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
