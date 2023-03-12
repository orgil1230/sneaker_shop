import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakers_shop/src/pages/cart/cart.dart';
import 'package:sneakers_shop/src/pages/home/home.dart';
import 'package:sneakers_shop/src/pages/user/user.dart';
import 'package:sneakers_shop/src/pages/wallet/wallet.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tab-screen';
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _pages = [
      {
        'page': HomeScreen(),
      },
      {
        'page': WalletScreen(),
      },
      {
        'page': CartScreen(),
      },
      {
        'page': UserScreen(),
      }
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/icon_home.svg',
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/icon_wallet.svg',
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/icon_cart.svg',
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/icon_user.svg',
              ),
              label: '',
            ),
          ],
        ));
  }
}
