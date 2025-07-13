import '../interfaces/home_repository.dart';

class GetHomeDataUseCase {
  final HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  Future<List<dynamic>> call() async {
    return await repository.getHomeData();
  }
}