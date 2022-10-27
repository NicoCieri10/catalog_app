import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_validation/home/home.dart';
import 'package:form_validation/l10n/l10n.dart';
import 'package:form_validation/login/login.dart';
import 'package:form_validation/product/product_page.dart';
import 'package:go_router/go_router.dart';
import 'package:product_client/product_client.dart';
import 'package:product_repository/product_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final productClient = ProductClient();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
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
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[500],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.black87,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }

  final GoRouter _router = GoRouter(
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
        builder: (context, state) => const ProductPage(),
      ),
    ],
  );
}
