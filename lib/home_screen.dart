import 'package:flutter/material.dart';
import 'gallery_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.onTap});
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
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
          final item = galleryData[index];
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
                            Navigator.of(
                              context,
                            ).pushNamed('/details', arguments: index);
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
      ),
    );
  }
}
