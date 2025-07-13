import '../../data/data/repository/implimentation/home_repository_impl.dart';
import '../domain/dashboard_entity.dart';
import '../interfaces/home_repository.dart';

class GetHomeDataUseCase {
  final HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  Future<DashboardEntity> call() async {
    return await repository.getHomeData();
  }
}
