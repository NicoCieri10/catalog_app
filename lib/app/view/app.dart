import 'package:appsize/appsize.dart';
import 'package:catalog_app/home/home.dart';
import 'package:catalog_app/l10n/l10n.dart';
import 'package:catalog_app/login/login.dart';
import 'package:catalog_app/product/product_page.dart';
import 'package:catalog_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:product_client/product_client.dart';
import 'package:product_repository/product_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final productClient = ProductClient();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: myThemeLight.primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: myThemeLight.primaryColor,
      ),
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: ProductRepository(productClient)),
      ],
      child: AppSize.child(
        child: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: myThemeLight,
    );
  }

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => const RoutingErrorPage(),
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/product',
        name: 'product',
        builder: (context, state) {
          final product = (state.extra as Map?)?['product'] as Product?;
          if (product == null) {
            throw ArgumentError.notNull('product');
          }
          return ProductPage(product);
        },
      ),
    ],
  );
}

class RoutingErrorPage extends StatelessWidget {
  const RoutingErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'No hay rutas',
        ),
      ),
    );
  }
}
