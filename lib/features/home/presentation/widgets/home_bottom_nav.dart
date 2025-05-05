import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_services),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_calendar),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
    );
  }
}
