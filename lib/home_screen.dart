import 'package:flutter/material.dart';
import 'package:flutter_picture_gallery/details_screen.dart';
import 'gallery_data.dart';

class HomeScreen extends StatelessWidget {
  void locateToDetailPage(index) {}
  const HomeScreen({super.key, this.onTap});
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: galleryData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.82,
        crossAxisCount: (MediaQuery.of(context).size.width / 200).toInt(),
      ),
      itemBuilder: (context, index) {
        final item = galleryData[index]; // GalleryItem (data)

        // Build a Widget from the data
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Card(
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(
                  eccentricity: 1,
                  side: BorderSide(width: 3),
                ),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: GestureDetector(
                        onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: 
                            (_) => DetailsScreen(index: index)));
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
      },
    );
  }
}
