
import 'package:flutter/material.dart';
import 'package:letslearn/features/home/data/datasources/home_data_source.dart';
import 'package:provider/provider.dart';

import 'core/providers/theme_provider.dart';
import 'features/home/data/repository/implimentation/home_repository_impl.dart';
import 'features/home/presentation/providers/home_provider.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/home/repository/interfaces/home_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(GetHomeDataUseCase(HomeRepositoryImpl(HomeDataSourceImpl()))),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'EduPrep',
            theme: themeProvider.themeData,
            home: HomeScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
