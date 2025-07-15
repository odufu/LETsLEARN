
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // For date formatting

class DateHeatmapWidget extends StatelessWidget {
  final List<int> activityLevels; // Array of activity levels (0-4) for each day

  const DateHeatmapWidget({required this.activityLevels, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final now = DateTime.now(); // 05:27 PM WAT, Tuesday, July 15, 2025
    final daysToShow = 7;
    final dates = List.generate(daysToShow, (index) => now.subtract(Duration(days: daysToShow - 1 - index)));

    // Debug: Print activity levels to console
    print('Activity Levels: $activityLevels');

    // Ensure activityLevels matches the number of days, use 0 as fallback for extra/missing values
    final effectiveActivityLevels = activityLevels.length >= daysToShow
        ? activityLevels.sublist(0, daysToShow)
        : List<int>.filled(daysToShow, 0, growable: false)
            .asMap()
            .map((index, value) => MapEntry(index, index < activityLevels.length ? activityLevels[index] : 0))
            .values
            .toList();

    if (effectiveActivityLevels.isEmpty) {
      return const Center(child: Text('No activity data available'));
    }

    return Card(
      color: themeProvider.themeData.cardColor,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final cellWidth = constraints.maxWidth / daysToShow - 4; // Adjust for margins
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(daysToShow, (index) {
                final date = dates[index];
                final activityLevel = effectiveActivityLevels[index].clamp(0, 4);
                final color = _getHeatmapColor(activityLevel);

                return Container(
                  width: cellWidth.clamp(24, 32), // Minimum 24px, max 32px
                  height: 32,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey[300]!, width: 1),
                    // Debug border
                  ),
                  child: Center(
                    child: Text(
                      DateFormat('d').format(date), // Day number (e.g., 9, 10)
                      style: themeProvider.themeData.textTheme.bodySmall?.copyWith(
                        color: _getTextColor(color),
                        fontSize: 10,
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }

  Color _getHeatmapColor(int level) {
    final colors = [
      Colors.grey[300], // Level 0: No activity
      Colors.green[100], // Level 1: Low activity
      Colors.green[200], // Level 2: Moderate activity
      Colors.green[400], // Level 3: High activity
      const Color(0xFF3B82F6), // Level 4: Max activity (blue accent)
    ];
    return colors[level] ?? Colors.grey[300]!;
  }

  Color _getTextColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}