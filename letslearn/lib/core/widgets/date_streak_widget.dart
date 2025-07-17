
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/theme_provider.dart'; // For date formatting

class DateStreakWidget extends StatelessWidget {
  final int streak; // Placeholder for streak count, to be dynamic later

  const DateStreakWidget({this.streak = 7, Key? key}) : super(key: key); // Default streak of 7

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final now = DateTime.now(); // 02:57 PM WAT, Thursday, July 17, 2025
    final formattedDate = DateFormat('MMMM dd, yyyy').format(now); // e.g., July 17, 2025
    final dayOfWeek = DateFormat('EEEE').format(now); // e.g., Thursday

    return Card(
      color: themeProvider.themeData.cardColor,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: themeProvider.themeData.textTheme.bodyMedium?.copyWith(
                    color: themeProvider.themeData.textTheme.bodyMedium?.color ?? Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dayOfWeek,
                  style: themeProvider.themeData.textTheme.bodySmall?.copyWith(
                    color: themeProvider.themeData.textTheme.bodySmall?.color ?? Colors.grey,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Streak',
                  style: themeProvider.themeData.textTheme.bodySmall?.copyWith(
                    color: themeProvider.themeData.textTheme.bodySmall?.color ?? Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '$streak',
                      style: themeProvider.themeData.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF3B82F6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.local_fire_department,
                      color: Color(0xFF3B82F6),
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}