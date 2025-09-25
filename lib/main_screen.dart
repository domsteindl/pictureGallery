import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'about_me_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    AboutMeScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onTabTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.image), label: 'Bilder'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Über mich'),
        ],
      ),
    );
  }
}
