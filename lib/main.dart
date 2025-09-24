import 'package:flutter/material.dart';
import 'package:flutter_picture_gallery/about_me_screen.dart';
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
  final List<Widget> screens = [HomeScreen(), AboutMeScreen()];
  final String screenTitle = '';
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) => setState(() {
            index = value;
          }),
          destinations: [
            NavigationDestination(icon: Icon(Icons.image), label: 'Bilder'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Über mich'),
          ],
        ),

        appBar: AppBar(title: Text(screenTitle)),
        body: IndexedStack(index: index, children: screens),
      ),
    );
  }
}
