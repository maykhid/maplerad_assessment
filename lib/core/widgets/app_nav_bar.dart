import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maplerad_assessment/app/ui/screens/home/home_screen.dart';
import 'package:maplerad_assessment/app/ui/resource/ui.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({super.key});

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  int currentTabIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.deepOrange),
  ];

  void _setCurrentTabTo({required int newTabIndex}) {
    setState(() {
      currentTabIndex = newTabIndex;
    });
  }

  final Map<String, dynamic> _iconAssets = {
    'Home': AppIcons.home,
    'Wirebeam': AppIcons.wirePay,
    'Cards': AppIcons.creditCard
  };

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return List.generate(
      _iconAssets.length,
      (index) => BottomNavigationBarItem(
        icon: BottomItemIcon(
          color: currentTabIndex == index ? AppColors.blue : AppColors.grey,
          assetName: _iconAssets.values.toList().elementAt(index),
        ),
        label: _iconAssets.keys.toList().elementAt(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (newTab) => _setCurrentTabTo(newTabIndex: newTab),
        currentIndex: currentTabIndex,
        items: _buildBottomNavigationBarItems(),
      ),
    );
  }
}

class BottomItemIcon extends StatelessWidget {
  const BottomItemIcon({
    super.key,
    required this.color,
    required this.assetName,
  });

  final Color color;

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      assetName,
    );
  }
}
