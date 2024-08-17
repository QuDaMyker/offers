part of '../constants.dart';

class AppColors {
  static Color get black => Colors.black;
  static Color get white => Colors.white;
  // static Color get bgColor => const Color(0xfff3deb7);
  static Color get bgColor => Colors.white;
  static List<Color> get gradientColors => const [
        Color(0xff040819),
        Color.fromARGB(255, 7, 13, 34),
        Color(0xff04091a),
        Color.fromARGB(255, 11, 30, 54),
        Color(0xff0f3253),
        Color(0xff0c3357),
      ];
  static Color get textColor => const Color(0xff0096d8);
  static Color get primaryColor => const Color.fromARGB(255, 225, 95, 15);
  static Color get secondaryColor => const Color(0xff202e2e);
  static Color get borderColor => const Color(0xff0092d3);
  static Color get deleteColor => Color.fromARGB(255, 236, 57, 57);
  static Color get editColor => const Color.fromARGB(255, 11, 30, 54);
}
