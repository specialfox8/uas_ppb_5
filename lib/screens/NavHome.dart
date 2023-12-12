import 'package:uas_ppb_5/providers/auth_provider.dart';
import 'package:uas_ppb_5/screens/cart_screen.dart';
import 'package:uas_ppb_5/screens/historyscreen.dart';
import 'package:uas_ppb_5/screens/homescreen.dart';
import 'package:uas_ppb_5/screens/voucher_screen.dart';
import 'package:uas_ppb_5/screens/profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_ppb_5/screens/profile_screen.dart';
import 'package:uas_ppb_5/screens/voucher_screen.dart';

class BarScreen extends StatelessWidget {
  const BarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyNavBarScreen();
  }
}

class MyNavBarScreen extends StatefulWidget {
  const MyNavBarScreen({super.key});

  @override
  State<MyNavBarScreen> createState() => _MyNavBarScreenState();
}

class _MyNavBarScreenState extends State<MyNavBarScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(), //Homescreen
    VoucherScreen(), //VoucherScreen
    CartScreen(), //HistoryScreen
    ProfileScreen(), //ProfilScreen
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(167, 211, 151, 1.000),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            // icon: Image.asset('assets/images/icons/LogoVoucher.png',
            //     width: 24, height: 24),
            label: 'Voucher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTap,
        type: BottomNavigationBarType.fixed,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
