import 'package:bazar_popular/_pages/product/user/my_product.dart';
import 'package:bazar_popular/_pages/product/product/product.dart';
import 'package:bazar_popular/_pages/product/upload/upload_product.dart';
import 'package:bazar_popular/layout/layout.dart';
import 'package:bazar_popular/_pages/home.dart';
import 'package:bazar_popular/_pages/login/login.dart';
import 'package:bazar_popular/_pages/product/create/create_product.dart';
import 'package:bazar_popular/_pages/product/create/create_shell.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
ShellRoute(
  builder: (context, state, child) => 
  LayoutBazar(child: child), 
  routes: [ 
    GoRoute(path: '/', builder: (context, state) => MyHomePage(title: "home") ), 
    GoRoute(path: '/produto/:id', builder: (context, state) {
          final String productId = state.pathParameters['id']!; // Obtém o ID da URL
          return ProductPage(id: productId); // Passa o ID como parâmetro
    } ),
    GoRoute(path: '/meus-produtos', builder: (context, state) => UserProduct() ),
    ShellRoute(
      builder: (context,state,child) => CreateProductShell(child:child),
      routes: [
        GoRoute(path: '/divulgar', builder: (context,state) => CreateProductStepOne()),
        GoRoute(path: '/divulgar/:tipo', builder: (context,state) => CreateProduct()),
        GoRoute(path: '/divulgar/:tipo/finalizar/:id', builder: (context,state) => UploadProduct()),

    ])
    
]),
    
]);
