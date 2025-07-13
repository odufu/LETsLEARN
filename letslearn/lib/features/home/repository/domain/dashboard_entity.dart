class DashboardEntity {
  final int learningProgress;
  final int testProgress;
  final int visitCount;
  final int dailyStreak;
  final List<String> friendsActivities;

  DashboardEntity({
    required this.learningProgress,
    required this.testProgress,
    required this.visitCount,
    required this.dailyStreak,
    required this.friendsActivities,
  });
}