import 'package:flutter/cupertino.dart';
import 'package:quotes_app/screen/edit/edit_screen.dart';
import 'package:quotes_app/screen/home/home_screen.dart';
import 'package:quotes_app/screen/quotes/quotes_screen.dart';
import 'package:quotes_app/screen/splash/splash_screen.dart';

Map<String,WidgetBuilder>app_routes =
{
  "/":(context) => const SplashScreen(),
  "home":(context) => const HomeScreen(),
  "quote":(context) => const QuotesScreen(),
  "edit":(context) => const EditScreen(),

};