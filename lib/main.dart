import 'package:flutter/material.dart';
import 'package:flutter_picture_gallery/about_me_screen.dart';
import 'package:flutter_picture_gallery/details_screen.dart';
import 'package:flutter_picture_gallery/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String screenTitle = '';

  int currentIndexNavigation = 0;
  int selectedImageIndex = 0;
  int bottomNavigationBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    switch (currentIndexNavigation) {
      case 0 || 1:
        screenTitle = "MyGallery";
        break;
      case 2:
        screenTitle = "Details";
        break;
      default:
        screenTitle = "Default";
    }
    final List<Widget> screens = [
      HomeScreen(
        onTap: (index) => setState(() {
          selectedImageIndex = index;
          currentIndexNavigation = 2;
        }),
      ),
      AboutMeScreen(),
      DetailsScreen(index: selectedImageIndex),
    ];

    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: bottomNavigationBarIndex,
          onDestinationSelected: (value) => setState(() {
            bottomNavigationBarIndex = value;
            currentIndexNavigation = value;
          }),
          destinations: [
            NavigationDestination(icon: Icon(Icons.image), label: 'Bilder'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Über mich'),
          ],
        ),

        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 94, 24, 19),
          title: Text(screenTitle),
        ),
        body: IndexedStack(
          index: currentIndexNavigation == 2
              ? currentIndexNavigation
              : bottomNavigationBarIndex,
          children: screens,
        ),
      ),
    );
  }
}
