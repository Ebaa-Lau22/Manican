import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manican/features/posts/presentation/pages/post_add_update_page.dart';
import 'package:manican/features/posts/presentation/pages/posts_page.dart';
import 'package:manican/routing/appRoute.dart';

class AppRouter {
  final GoRouter goRouter;

  static late AppRouter _appRouter;

  static init() {
    _appRouter = AppRouter();
  }

  AppRouter() : goRouter = _getRouter;

  static get getRouter => _appRouter.goRouter;

  static get _getRouter => GoRouter(
        initialLocation: AppRoute.home,
        observers: [],
        errorBuilder: (context, state) => const PostsPage(),
        routes: <RouteBase>[
          GoRoute(
            path: AppRoute.signIn,
            builder: (BuildContext context, GoRouterState state) {
              return const PostAddUpdatePage(isUpdatePost: false,);
            },
          ),
        ],
      );
}
