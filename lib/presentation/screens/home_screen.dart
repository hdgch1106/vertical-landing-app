import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/config/mouse/mouse_draggable_scroll_behavior.dart';
import 'package:vertical_landing_page/presentation/providers/page_provider.dart';
import 'package:vertical_landing_page/presentation/shared/widgets/custom_app_menu.dart';
import 'package:vertical_landing_page/presentation/views/about_view.dart';
import 'package:vertical_landing_page/presentation/views/contact_view.dart';
import 'package:vertical_landing_page/presentation/views/home_view.dart';
import 'package:vertical_landing_page/presentation/views/location_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildBoxDecoration(),
        child: const Stack(
          children: [
            _HomeBody(),
            Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu(),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.purple,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
        ),
      );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return ScrollConfiguration(
      behavior: MouseDraggableScrollBehavior(),
      child: PageView(
        pageSnapping: false,
        controller: pageProvider.scrollController,
        scrollDirection: Axis.vertical,
        children: const [
          HomeView(),
          AboutView(),
          LocationView(),
          ContactView(),
        ],
      ),
    );
  }
}
