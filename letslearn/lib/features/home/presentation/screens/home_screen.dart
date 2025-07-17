
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // For date formatting
import '../../../../core/core/widgets/bottom_nav_bar.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/date_heatmap_widget.dart.dart';
import '../../../../core/widgets/date_streak_widget.dart';

// Course Data Class
class Course {
  final String name;
  final String subject;
  final double progress;

  Course({required this.name, required this.subject, required this.progress});
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final width = MediaQuery.of(context).size.width;
    // Sample course list
    final List<Course> courses = [
      Course(name: 'Reproduction', subject: 'BIOLOGY', progress: 0.75),
      Course(name: 'Force', subject: 'PHYSICS', progress: 0.60),
      Course(name: 'Chemical Reactions', subject: 'CHEMISTRY', progress: 0.45),
    ];
    return Scaffold(
      appBar:AppBarWidget(
        onSettingsTap: () {
          // Custom action for notifications
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Notifications tapped!')),
          );
        },
        userFullName: 'John Doe', // Replace with dynamic user name
        notificationCount: 3, // Replace with dynamic notification count
        onHelpTap: () {
          // Custom action for help
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Help tapped!')),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DashboardHeader(
              activityLevels: [4, 3, 2, 1, 2, 3, 4], // July 11-17, 2025
              streak: 7,
            ),
            DashboardContent(width: width, courses: courses),
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
}

// Dashboard Header Widget
class DashboardHeader extends StatelessWidget {
  final List<int> activityLevels;
  final int streak;

  const DashboardHeader({
    required this.activityLevels,
    required this.streak,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateHeatmapWidget(activityLevels: activityLevels),
        DateStreakWidget(streak: streak),
      ],
    );
  }
}

// Dashboard Content Widget
class DashboardContent extends StatelessWidget {
  final double width;
  final List<Course> courses;

  const DashboardContent({required this.width, required this.courses, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
         
          NavGrid(), // Removed fixed height to allow dynamic sizing
          
          CourseProgressWidget(courses: courses),

          ActivityTile(activity: 'John completed a test'),
          ActivityTile(activity: 'Alice started a module'),
        ],
      ),
    );
  }
}

// Nav Grid Widget
class NavGrid extends StatelessWidget {
  final List<Map<String, dynamic>> navItems = [
    {'label': 'Courses', 'icon': Icons.book, 'route': '/courses'},
    {'label': 'Progress', 'icon': Icons.trending_up, 'route': '/progress'},
    {'label': 'Friends', 'icon': Icons.people, 'route': '/friends'},
    {'label': 'Settings', 'icon': Icons.settings, 'route': '/settings'},
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Wrap(
      spacing: 8.0, // Horizontal space between items
      runSpacing: 8.0, // Vertical space between rows
      children: navItems.map((item) {
        return Card(
          color: Colors.transparent, // Use gradient background
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: () {
              // Navigator.pushNamed(context, item['route']);
              // Placeholder: Replace with actual route navigation
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).cardColor.withOpacity(.8), Theme.of(context).cardColor.withOpacity(0.2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Dynamic height based on content
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'],
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 16,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['label'],
                      style: themeProvider.themeData.textTheme.bodyMedium?.copyWith(
                        fontSize: 7,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Activity Tile Widget
class ActivityTile extends StatelessWidget {
  final String activity;

  const ActivityTile({required this.activity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person, color: Colors.white70),
      title: Text(activity),
    );
  }
}

// Course Progress Widget
class CourseProgressWidget extends StatelessWidget {
  final List<Course> courses;

  const CourseProgressWidget({required this.courses, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final width = MediaQuery.of(context).size.width;
    return Card(
      color: themeProvider.themeData.cardColor,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: courses.map((course) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    _getCourseIcon(course.name),
                    color: themeProvider.themeData.iconTheme.color,
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(8),
                          value: course.progress,
                          backgroundColor: Colors.grey[300],
                          color: const Color(0xFF3B82F6),
                          minHeight: 6,
                          semanticsLabel: '${course.name}/${course.subject}',
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${course.name}/${course.subject}',
                          style: themeProvider.themeData.textTheme.bodyMedium?.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${(course.progress * 100).toStringAsFixed(0)}%',
                    style: themeProvider.themeData.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  IconData _getCourseIcon(String name) {
    switch (name) {
      case 'Reproduction':
        return Icons.book; // Biology icon
      case 'Force':
        return Icons.speed; // Physics icon
      case 'Chemical Reactions':
        return Icons.science; // Chemistry icon
      default:
        return Icons.book; // Default icon
    }
  }
}