
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
        title: const Text(
          'EduPrep',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildInsightCard(
              context,
              title: 'Learning Progress',
              value: '75%', // Placeholder
              icon: Icons.school,
            ),
            _buildInsightCard(
              context,
              title: 'Test Progress',
              value: '60%', // Placeholder
              icon: Icons.description,
            ),
            _buildInsightCard(
              context,
              title: 'Visits',
              value: '15', // Placeholder
              icon: Icons.visibility,
            ),
            _buildInsightCard(
              context,
              title: 'Daily Streak',
              value: '7 days', // Placeholder
              icon: Icons.local_fire_department,
            ),
            const SizedBox(height: 16),
            const Text(
              'Friends Activities',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildActivityTile('John completed a test'), // Placeholder
            _buildActivityTile('Alice started a module'), // Placeholder
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          // Handle navigation based on index
        },
        currentIndex: 0,
      ),
    );
  }

  Widget _buildInsightCard(BuildContext context, {required String title, required String value, required IconData icon}) {
        final themeProvider = Provider.of<ThemeProvider>(context);

    return Card(
      color: themeProvider.themeData.cardColor,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: themeProvider.themeData.iconTheme.color),
        title: Text(title, style: themeProvider.themeData.textTheme.bodyMedium),
        trailing: Text(value, style: themeProvider.themeData.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildActivityTile(String activity) {
    
    return ListTile(
      leading: const Icon(Icons.person, color: Colors.white70),
      title: Text(activity, ),
    );
  }
}
