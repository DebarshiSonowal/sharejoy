import 'package:flutter/material.dart';
import 'package:sharejoy/Constants/assets.dart';
import 'package:sharejoy/Model/celebration.dart';

import '../Model/institution.dart';

class Constants {
  static const Color primaryColor = Color(0xff7A00E6);
  static const Color selected = Color(0xffFFF38D);
  static const Color linearFirst = Color(0xff9620FF);
  static const Color linearSecond = Color(0xff0A8ED9);
  static const Color selectedBorder = Color(0xff1e8b6b);
  static const Color blackColor = Color(0xff202020);
  static const Color backgroundColor = Color(0xff121212);
  static const Color bottomBarColor = Color(0xff1B1B1B);

  static List<Celebration> celebrations = [
    Celebration(
      "Create a Celebration",
      "Donate surplus items and more",
      Assets.celebrationImage,
    ),
    Celebration(
      "Create an Event",
      "Donate and enjoy it with them",
      Assets.celebrationImage,
    ),
    Celebration(
      "Create an Event",
      "Donate and enjoy it with them",
      Assets.celebrationImage,
    ),
    Celebration(
      "Create an Event",
      "Donate and enjoy it with them",
      Assets.celebrationImage,
    ),
  ];

  static List<String> category = [
    "NGOs",
    "Old Age Homes",
    "Orphanage",
    "Rehabilitation",
  ];

  static List<Institution> institutions = [
    Institution("Utkarm NGO", "Ganeshguri, Guwahati, Assam", "15KM",
        Assets.instituteImage),
    Institution(
        "SAYA NGO", "Beltola, Guwahati, Assam", "12KM", Assets.institute2Image),
    Institution("Koumudaloy Orphanage", "Khanapara, Guwahati, Assam", "10KM",
        Assets.instituteImage),
    Institution("Utkarm NGO", "Ganeshguri, Guwahati, Assam", "15KM",
        Assets.institute2Image),
  ];

  static List<IconData> icons = [
    Icons.home,
    Icons.heart_broken,
    Icons.notifications,
    Icons.shopping_cart,
  ];
}
