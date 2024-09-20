import 'package:astrobooks/models/cart_model.dart';
import 'package:astrobooks/pages/cartpage.dart';
import 'package:astrobooks/pages/homepage.dart';
import 'package:astrobooks/pages/searchpage.dart';
import 'package:astrobooks/pages/welcome_page.dart';
import 'package:astrobooks/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Cart(),
    builder: (context, child) => MaterialApp(
      home: WelcomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      routes: {
        '/homepage':(context)=>HomePage(),
        '/searchpage':(context)=>SearchPage(),
        '/cartpage':(context)=>CartPage(),
        '/welcome':(context)=>WelcomePage(),
      },
    ),
    );
  }
}
