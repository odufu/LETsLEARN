
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSettingsTap;

  const AppBarWidget({this.onSettingsTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      backgroundColor: const Color(0xFF3B82F6), // Blue header as per UI notes
      title: const Text(
        'LetsLearn',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: onSettingsTap ?? () {
            // Placeholder action
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Settings coming soon!')),
            );
          },
        ),
      ],
      elevation: 2.0, // Subtle shadow for depth
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // 56px standard height
}