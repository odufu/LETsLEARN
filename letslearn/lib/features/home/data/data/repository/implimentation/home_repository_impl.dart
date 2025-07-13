
import '../../../../repository/domain/dashboard_entity.dart';

abstract class HomeRepository {
  Future<DashboardEntity> getHomeData();
}