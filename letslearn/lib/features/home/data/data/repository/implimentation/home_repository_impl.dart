

import '../../../../repository/domain/home_entity.dart';
import '../../../../repository/interfaces/home_repository.dart';
import '../../../datasources/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<List<HomeEntity>> getHomeData() async {
    final models = await dataSource.getHomeData();
    return models.map((model) => HomeEntity(title: model.title, icon: model.icon)).toList();
  }
}