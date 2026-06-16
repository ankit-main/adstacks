import 'package:flutter/material.dart';
import '../models/menu_model.dart';

class SidebarData {
  static List<MenuModel> menuItems = [
    MenuModel(
      title: "Home",
      icon: Icons.home_rounded,
    ),
    MenuModel(
      title: "Employees",
      icon: Icons.people_outline,
    ),
    MenuModel(
      title: "Attendance",
      icon: Icons.fact_check_outlined,
    ),
    MenuModel(
      title: "Summary",
      icon: Icons.bar_chart_outlined,
    ),
    MenuModel(
      title: "Information",
      icon: Icons.info_outline,
    ),
  ];
}