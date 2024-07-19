import 'package:contact_app/controller/utils/theme/icont_icons.dart';
import 'package:contact_app/view/home/home_view.dart';
import 'package:contact_app/view/profile/profile_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const ProfileView(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icont.menu), label: ""),
          BottomNavigationBarItem(icon: Icon(Icont.person), label: ""),
        ],
      ),
    );
  }
}
