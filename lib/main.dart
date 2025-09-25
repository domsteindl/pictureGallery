import 'package:flutter/material.dart';
import 'package:flutter_picture_gallery/details_screen.dart';
import 'package:flutter_picture_gallery/main_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // int currentIndexNavigation = 0;
  // final int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        //    'detail': (context) => DetailsScreen(index: selectedImageIndex),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final index = settings.arguments as int;
          return MaterialPageRoute(builder: (_) => DetailsScreen(index: index));
        }
        return null;
      },

    

      /* home: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: bottomNavigationBarIndex,
          onDestinationSelected: (value) => setState(() {
            bottomNavigationBarIndex = value;
          //  currentIndexNavigation = value;
          }),
          destinations: [
            NavigationDestination(icon: Icon(Icons.image), label: 'Bilder'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Über mich'),
          ],
        ),

        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 94, 24, 19),
          title: Text("MyGallery"),
        ),
        body: IndexedStack(
          index: /* currentIndexNavigation == 2
              ? currentIndexNavigation
              : */
              bottomNavigationBarIndex,
          children: screens,
        ),
      ),
      */
    );
  }
}
