import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/downloads/screen_download.dart';
import 'package:flutter_application_2/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:flutter_application_2/presentation/home/screen_home.dart';
import 'package:flutter_application_2/presentation/main_page/widgets/bottom_nav.dart';
import 'package:flutter_application_2/presentation/new_and_hot/screnn_new_and_hot.dart';
import 'package:flutter_application_2/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
    const ScreenHome(),
    const ScreenFastLaugh(),
    const ScreenNewAndHot(),
    const ScreenSearch(),
     ScreenDownload(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: intexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidgets(),
    );
  }
}
