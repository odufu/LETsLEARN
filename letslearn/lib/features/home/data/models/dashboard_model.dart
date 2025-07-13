
class DashboardModel {
  final int learningProgress; // Percentage
  final int testProgress;    // Percentage
  final int visitCount;
  final int dailyStreak;
  final List<String> friendsActivities; // Example: ["John completed a test", "Alice started a module"]

  DashboardModel({
    required this.learningProgress,
    required this.testProgress,
    required this.visitCount,
    required this.dailyStreak,
    required this.friendsActivities,
  });
}