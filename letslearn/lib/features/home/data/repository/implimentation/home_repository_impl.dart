
import '../../../repository/domain/dashboard_entity.dart';
import '../../data/repository/implimentation/home_repository_impl.dart';
import '../../datasources/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<DashboardEntity> getHomeData() async {
    final model = await dataSource.getDashboardData();
    return DashboardEntity(
      learningProgress: model.learningProgress,
      testProgress: model.testProgress,
      visitCount: model.visitCount,
      dailyStreak: model.dailyStreak,
      friendsActivities: model.friendsActivities,
    );
  }
}