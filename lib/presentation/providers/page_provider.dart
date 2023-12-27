import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:vertical_landing_page/config/helper/capitalize.dart';

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = [
    "/home",
    "/about",
    "/location",
    "/contact",
  ];
  int _currentIndex = 0;

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: _getPageIndex(routeName));
    String route = _pages[_getPageIndex(routeName)];
    html.document.title = capitalizeFirstLetter(route.replaceAll("/", ""));
    scrollController.addListener(() {
      final index = (scrollController.page ?? 0).round();
      if (index != _currentIndex) {
        html.window.history.pushState(null, "none", "#${_pages[index]}");
        _currentIndex = index;
        String route = _pages[index];
        html.document.title = capitalizeFirstLetter(route.replaceAll("/", ""));
      }
    });
  }

  int _getPageIndex(String routeName) {
    return !_pages.contains(routeName) ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    //final routeName = _pages[index];
    html.window.history.pushState(null, "none", "#${_pages[index]}");
    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
