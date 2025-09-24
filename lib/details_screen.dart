import 'package:flutter/material.dart';
import 'package:flutter_picture_gallery/gallery_data.dart';

class DetailsScreen extends StatelessWidget {
  final int index;
  const DetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 94, 24, 19),
        title: Text("Details", style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.asset(
                galleryData[index].imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(galleryData[index].imageTitle),
                  Text(galleryData[index].imageDescription),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
