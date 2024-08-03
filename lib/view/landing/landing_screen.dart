import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:food_subs/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:food_subs/view/order_history/order_history_screen.dart';
import 'package:food_subs/view/subscription/subscription_screen.dart';
import 'package:food_subs/view/user_profile/user_profile_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedItemPosition = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const SubscriptionScreen(),
    const OrderHistoryScreen(),
    const UserProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedItemPosition],
      bottomNavigationBar: SnakeNavigationBar.color(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 45,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        backgroundColor: Colors.white,
        snakeViewColor: AppColors.primary,
        selectedItemColor: AppColors.green,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Colors.grey[300]!),
            label: '',
            activeIcon: const Icon(Icons.home_filled, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dinner_dining_outlined, color: Colors.grey[300]),
            label: '',
            activeIcon:
                const Icon(Icons.dinner_dining_outlined, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: Colors.grey[300]),
            label: '',
            activeIcon: const Icon(Icons.dashboard, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled, color: Colors.grey[300]),
            activeIcon:
                const Icon(CupertinoIcons.profile_circled, color: Colors.white),
            label: '',
          ),
        ],
      ),
    );
  }
}
