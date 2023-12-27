import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/presentation/providers/page_provider.dart';
import 'package:vertical_landing_page/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: "/home",
  errorPageBuilder: (context, state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const HomeScreen(),
    );
  },
  routes: [
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  redirect: (context, state) {
    final isGoingTo = state.matchedLocation;
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    pageProvider.createScrollController(isGoingTo);
    return null;
  },
);
