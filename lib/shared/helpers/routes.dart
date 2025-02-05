import 'package:bazar_popular/_pages/logout/logout_page.dart';
import 'package:bazar_popular/_pages/product/favorites/favorites_page.dart';
import 'package:bazar_popular/_pages/product/user/my_product.dart';
import 'package:bazar_popular/_pages/product/product/product_page.dart';
import 'package:bazar_popular/_pages/product/upload/upload_product.dart';
import 'package:bazar_popular/_pages/user/profile/profile_page.dart';
import 'package:bazar_popular/layout/layout.dart';
import 'package:bazar_popular/_pages/home_page.dart';
import 'package:bazar_popular/_pages/login/login_page.dart';
import 'package:bazar_popular/_pages/product/create/create_product_page.dart';
import 'package:bazar_popular/_pages/product/create/create_shell_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
  GoRoute(path: '/logout', builder: (context, state) => Logout()),
  ShellRoute(
      builder: (context, state, child) => LayoutBazar(child: child),
      routes: [
        GoRoute(
            path: '/', builder: (context, state) => MyHomePage(title: "home")),
        GoRoute(
            path: '/produto/:id',
            builder: (context, state) {
              final String productId =
                  state.pathParameters['id']!; // Obtém o ID da URL
              return ProductPage(id: productId); // Passa o ID como parâmetro
            }),
        GoRoute(
            path: '/meus-produtos', builder: (context, state) => UserProduct()),
        GoRoute(
            path: '/meu-perfil', builder: (context, state) => ProfilePage()),
        GoRoute(path: '/favoritos', builder: (context, state) => Favorites()),
        ShellRoute(
            builder: (context, state, child) =>
                CreateProductShell(child: child),
            routes: [
              GoRoute(
                  path: '/divulgar',
                  builder: (context, state) => CreateProductStepOne()),
              GoRoute(
                  path: '/divulgar/:tipo',
                  builder: (context, state) => CreateProduct()),
              GoRoute(
                  path: '/divulgar/:tipo/finalizar/:id',
                  builder: (context, state) => UploadProduct()),
            ])
      ]),
]);
