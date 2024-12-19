import 'package:bazar_popular/_pages/product/upload_product.dart';
import 'package:bazar_popular/layout/layout.dart';
import 'package:bazar_popular/_pages/home.dart';
import 'package:bazar_popular/_pages/login/login.dart';
import 'package:bazar_popular/_pages/product/create_product.dart';
import 'package:bazar_popular/_pages/produto.dart';
import 'package:bazar_popular/_pages/product/create_shell.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
ShellRoute(
  builder: (context, state, child) => 
  LayoutBazar(child: child), 
  routes: [ 
    GoRoute(path: '/', builder: (context, state) => const MyHomePage(title: "home") ), 
    GoRoute(path: '/produto', builder: (context, state) => const Produto() ),
    ShellRoute(
      builder: (context,state,child) => CreateProductShell(child:child),
      routes: [
        GoRoute(path: '/divulgar', builder: (context,state) => CreateProductStepOne()),
        GoRoute(path: '/divulgar/:tipo', builder: (context,state) => CreateProduct()),
        GoRoute(path: '/divulgar/:tipo/finalizar/:id', builder: (context,state) => UploadProduct()),

    ])
    
]),
    
]);
