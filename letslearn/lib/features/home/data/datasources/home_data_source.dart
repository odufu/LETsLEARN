import 'package:flutter/material.dart';

import '../models/home_model.dart';

abstract class HomeDataSource {
  Future<List<HomeModel>> getHomeData();
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<List<HomeModel>> getHomeData() async {
    // Simulated data (replace with API call or database)
    return [
      HomeModel(title: 'Learning', icon: Icons.book),
      HomeModel(title: 'Practice', icon: Icons.edit),
    ];
  }
}
