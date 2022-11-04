import 'package:bike_near_me_app/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bike_near_me_app/src/pages/mainPage.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => MainPage(title: 'title also here',),
      '/home': (_) => const HomePage(),
      // '/detail': (_) => ProductDetailPage()
    };
  }
}
