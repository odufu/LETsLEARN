
import 'package:flutter/material.dart';

import '../../repository/domain/dashboard_entity.dart';
import '../../repository/interfaces/home_repository.dart';

class HomeProvider extends ChangeNotifier {
  final GetHomeDataUseCase _getHomeDataUseCase;
  DashboardEntity? _dashboardData;
  bool _isLoading = false;

  HomeProvider(this._getHomeDataUseCase);

  DashboardEntity? get dashboardData => _dashboardData;
  bool get isLoading => _isLoading;

  Future<void> fetchDashboardData() async {
    _isLoading = true;
    notifyListeners();
    try {
      _dashboardData = await _getHomeDataUseCase();
    } catch (e) {
      // Handle error (e.g., show a snackbar)
      print(e);
    }
    _isLoading = false;
    notifyListeners();
  }
}