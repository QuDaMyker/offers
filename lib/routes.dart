import 'package:flutter/material.dart';
import 'package:offers/common/constants.dart';
import 'package:offers/widgets/screens/home_screen.dart';

Route<dynamic> mainRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteList.home:
      return MaterialPageRoute(builder: (contex) => const HomeScreen());
    default:
      return MaterialPageRoute(builder: (contex) => const HomeScreen());
  }
}
