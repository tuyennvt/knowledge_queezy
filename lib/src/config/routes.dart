import 'package:flutter/material.dart';
import 'package:knowledge_queezy/src/modules/main/main_page.dart';
import 'package:knowledge_queezy/src/modules/play/play_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  MainPage.routeName: (context) => const MainPage(),
  PlayPage.routeName: (context) => const PlayPage(),
};
