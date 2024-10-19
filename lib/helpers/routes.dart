import 'package:bazar_popular/main.dart';
import 'package:bazar_popular/pages/home.dart';
import 'package:bazar_popular/pages/login.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase> [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: 'Bazar Popular')
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage()
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    )
  ]
);