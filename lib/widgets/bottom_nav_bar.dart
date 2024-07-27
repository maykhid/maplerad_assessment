import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maplerad_assessment/screens/home.dart';
import 'package:maplerad_assessment/shared/ui/ui.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
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

  final List<String> _iconAssets = [
    AppIcons.home,
    AppIcons.wirePay,
    AppIcons.creditCard,
  ];

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return List.generate(
      _iconAssets.length,
      (index) => BottomNavigationBarItem(
        icon: BottomItemIcon(
          color: currentTabIndex == index ? AppColors.blue : AppColors.grey,
          assetName: _iconAssets[index],
        ),
        label: '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
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
