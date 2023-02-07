import 'package:catalog_app/theme/theme.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: myThemeLight.primaryColor,
        ),
      ),
    );
  }
}
