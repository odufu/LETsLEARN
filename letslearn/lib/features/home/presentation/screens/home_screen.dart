import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/core/widgets/bottom_nav_bar.dart';
import '../../../../core/providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.themeData.scaffoldBackgroundColor,
        title:  Text(
          'EduPrep',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.settings, color:  Theme.of(context).colorScheme.onSurface),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
           Text(
            'Explore',
            style: TextStyle(
              color:  Theme.of(context).colorScheme.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildListTile(
            context,
            icon: Icons.book,
            title: 'Learning',
            subtitle: 'Structured learning modules',
          ),
          _buildListTile(
            context,
            icon: Icons.edit,
            title: 'Practice',
            subtitle: 'Practice questions and mock exams',
          ),
          _buildListTile(
            context,
            icon: Icons.person,
            title: 'Tutor Connect',
            subtitle: 'Connect with tutors',
          ),
          _buildListTile(
            context,
            icon: Icons.forum,
            title: 'Support',
            subtitle: 'Community forum for discussions',
          ),
          _buildListTile(
            context,
            icon: Icons.share,
            title: 'Social',
            subtitle: 'Share your progress',
          ),
          _buildListTile(
            context,
            icon: Icons.account_circle,
            title: 'Profile',
            subtitle: 'Your profile and settings',
          ),
        ],
      ),
      bottomNavigationBar:BottomNavBar(
        onTap: (index) {
          // Handle navigation based on index
          // Example: Navigate to respective screens
        },
        currentIndex: 0, // Default to Home
      ),
    );
  }

  Widget _buildListTile(BuildContext context, {required IconData icon, required String title, required String subtitle}) {
     final themeProvider = Provider.of<ThemeProvider>(context);
    return ListTile(
      leading: Icon(icon, color: themeProvider.themeData.iconTheme.color),
      title: Text(title, style: themeProvider.themeData.textTheme.bodyMedium),
      subtitle: Text(subtitle, style: themeProvider.themeData.textTheme.bodySmall),
      onTap: () {
        // Handle navigation to respective feature
      },
    );
  }
}
