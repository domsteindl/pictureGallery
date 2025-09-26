import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import '../../../gallery/presentation/screens/gallery_screen.dart';
import '../../../profile/presentation/screens/about_me_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    GalleryScreen(),
    AboutMeScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: const Color.fromARGB(255, 94, 24, 19),
        title: Center(child: Text("MyGallery", style: TextStyle(color: Colors.white),)),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        items: [  
        FlashyTabBarItem(icon: Icon(Icons.image), title: Text("Bilder")) ,
         FlashyTabBarItem(icon: Icon(Icons.person), title: Text("Über mich"))
        ], onItemSelected: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
    )/* NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onTabTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.image), label: 'Bilder'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Über mich'),
        ],
      )*/,
    );
  }
}
