import '../domain/home_entity.dart';

abstract class HomeRepository {
  Future<List<HomeEntity>> getHomeData();
}