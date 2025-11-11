// lib/main_screen.dart
import 'package:ev_smart_screen/views/home_view.dart';
import 'package:ev_smart_screen/views/apps_view.dart'; // We will create this
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Tracks which tab is currently selected

  // NEW: List of only two views
  static const List<Widget> _views = <Widget>[
    HomeView(),
    AppsView(), // The new app grid screen
  ];

  // Function to call when a tab is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body will be the currently selected view from our list
      body: Center(child: _views.elementAt(_selectedIndex)),

      // NEW: The 2-icon navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Apps'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent, // Color for selected icon
        unselectedItemColor: Colors.grey, // Color for unselected icons
        onTap: _onItemTapped,
        backgroundColor: Colors.black, // Navbar background color
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
      ),
    );
  }
}
