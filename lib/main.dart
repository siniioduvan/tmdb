import 'package:flutter/material.dart';
import 'package:tmdb/theme/app_colors.dart';
import 'package:tmdb/widgets/auth/auth_widget.dart';
import 'package:tmdb/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainDarkBlue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey
          ),
          appBarTheme:
              const AppBarTheme(backgroundColor: AppColors.mainDarkBlue),
          //primarySwatch: Colors.blue,
        ),
        routes: {
          '/auth': (context) => AuthWidget(),
          '/mainScreen': (context) => MainScreen()
        },
        initialRoute: '/auth',
    );
  }
}
