import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const BottomNavBar({
    required this.onTap,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BottomNavigationBar(
      backgroundColor: themeProvider.themeData.bottomNavigationBarTheme.backgroundColor,
      selectedItemColor: themeProvider.themeData.bottomNavigationBarTheme.selectedItemColor,
      unselectedItemColor: themeProvider.themeData.bottomNavigationBarTheme.unselectedItemColor,
      type: BottomNavigationBarType.fixed, // Ensures all items are visible
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
        BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Practice'),
        BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline), label: 'Live'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Social'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}