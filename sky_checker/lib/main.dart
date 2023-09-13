import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sky_checker/SKY_SCRAPPER/view/pages/Homepage.dart';

import 'SKY_SCRAPPER/controller/api.dart';
import 'SKY_SCRAPPER/controller/themeProvider.dart';
import 'SKY_SCRAPPER/view/pages/SearchScreen.dart';
import 'SKY_SCRAPPER/view/pages/SplashScreen.dart';

void main() {
   runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => APICallProvider(),
    ),
    ChangeNotifierProvider(create: (context) => ModelTheme(),)
  ], child: Consumer<ModelTheme>(
    builder: (context, themeNotifier, child) {
      return MaterialApp(
        
          home: SplashScreen(),
        theme: themeNotifier.isDark
            ? ThemeData(

            useMaterial3: true,
            brightness: Brightness.dark)
            :ThemeData(
            useMaterial3: true,
            brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      );
      },
  ),));
}
