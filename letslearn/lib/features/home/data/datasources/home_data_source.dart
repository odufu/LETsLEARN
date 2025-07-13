import '../models/dashboard_model.dart';

abstract class HomeDataSource {
  Future<DashboardModel> getDashboardData();
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<DashboardModel> getDashboardData() async {
    // Simulated data (replace with API call or database)
    return DashboardModel(
      learningProgress: 75,
      testProgress: 60,
      visitCount: 15,
      dailyStreak: 7,
      friendsActivities: [
        "John completed a test",
        "Alice started a module",
      ],
    );
  }
}