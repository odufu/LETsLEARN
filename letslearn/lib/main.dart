import 'package:flutter/material.dart';
import 'package:letslearn/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //remove the debug banner
    
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'EduPrep',
            theme: themeProvider.themeData,
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            // Optional: Add named routes for other features if needed
            // initialRoute: '/home',
            // routes: {
            //   '/home': (context) => HomeScreen(),
            //   '/profile': (context) => ProfileScreen(),
            // },
          );
        },
      ),
    );
  }
}
