import 'package:bazar_popular/layout/layout.dart';
import 'package:bazar_popular/pages/home.dart';
import 'package:bazar_popular/pages/login/login.dart';
import 'package:bazar_popular/pages/produto.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
ShellRoute(builder: (context, state, child) => LayoutBazar(child: child), routes: [ GoRoute(path: '/', builder: (context, state) => const MyHomePage(title: "home") ), GoRoute(path: '/produto', builder: (context, state) => const Produto() ) ] )
],);
