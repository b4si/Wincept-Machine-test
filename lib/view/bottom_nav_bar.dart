import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_wincept/utils/colors.dart';
import 'package:machine_test_wincept/view/cart_screen.dart';
import 'package:machine_test_wincept/view/favourite_screen.dart';
import 'package:machine_test_wincept/view/home_screen.dart';
import 'package:machine_test_wincept/view/orders_screen.dart';
import 'package:machine_test_wincept/view/setting_screen.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<String> iconList = [
    'asset/home.png',
    'asset/Favourite.png',
    'asset/cart.png',
    'asset/Settings.png',
  ];

  final labelList = <String>[
    'Home',
    'Favourites',
    'Cart',
    'Settings',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  Widget _buildIconWithLabel(String iconPath, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconPath,
          color: isSelected ? primaryColor : secondaryColor,
          height: 24,
          width: 24,
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? primaryColor : secondaryColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomeScreen(),
          FavouriteScreen(),
          CartScreen(),
          SettingScreen()
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OrdersScreen(),
            ),
          );
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(0.5, 0.5),
              blurRadius: 6,
              spreadRadius: 0.5,
            ),
          ], color: fifthColor, borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(
              'asset/coffee.png',
              height: 10,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          return _buildIconWithLabel(
              iconList[index], labelList[index], isActive);
        },
        height: 65,
        shadow: BoxShadow(
          color: Colors.grey.shade400,
          offset: const Offset(-1, -1),
          blurRadius: 6,
          spreadRadius: 0.5,
        ),
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          _onItemTapped(index);
        },
        backgroundColor: Colors.white,
        // inactiveColor: Colors.grey.shade600,
        // activeColor: Colors.black,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
