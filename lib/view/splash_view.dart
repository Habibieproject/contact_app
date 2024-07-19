import 'package:contact_app/controller/data/shared_preference.dart';
import 'package:contact_app/controller/utils/ext/navigation.dart';
import 'package:contact_app/view/login/login_view.dart';
import 'package:contact_app/view/main/main_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    bool isLoggedIn = await PreferenceHandler.retrieveIsLoggedIn() ?? false;

    if (isLoggedIn) {
      context.pushReplacement(const MainView());
    } else {
      context.pushReplacement(const LoginView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
