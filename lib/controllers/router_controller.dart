import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/routes.dart';
import '../pages/data_entry_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/process_algebraic_page.dart';
import '../pages/process_graphic_page.dart';
import '../pages/process_simplex_page.dart';
import 'db_controller.dart';

part 'router_controller.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final router = GoRouter(
    refreshListenable: ref.read(dbLoginProvider).listenable(keys: [
      userKey,
    ]),
    redirect: (context, state) async {
      final loginBox = ref.read(dbLoginProvider);
      final bool isLoggedIn = loginBox.get(userKey) != null;
      final location = state.uri.toString();
      if (!isLoggedIn && location != routeLogin) {
        return routeLogin;
      }
      if (isLoggedIn && location == routeLogin) {
        return routeHome;
      }
      return null;
    },
    initialLocation: routeLogin,
    routes: [
      GoRoute(
        path: routeLogin,
        name: routeLoginName,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: routeHome,
        name: routeHomeName,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: routeDataEntry,
            name: routeDataEntryName,
            builder: (context, state) => const DataEntryPage(),
            routes: [
              GoRoute(
                path: routeAlgebraicProcess,
                name: routeAlgebraicProcessName,
                builder: (context, state) => const AlgebraicProcessPage(),
              ),
              GoRoute(
                path: routeGraphicProcess,
                name: routeGraphicProcessName,
                builder: (context, state) => const GraphicProcessPage(),
              ),
              GoRoute(
                path: routeSimplexProcess,
                name: routeSimplexProcessName,
                builder: (context, state) => const SimplexProcessPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
