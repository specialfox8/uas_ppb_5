import 'package:flutter/material.dart';

class NavHome extends StatefulWidget {
  const NavHome({super.key});

  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    // Widget untuk halaman pertama
    Container(
      color: Colors.blue,
      child: Center(
        child: Text('Halaman 1'),
      ),
    ),
    // Widget untuk halaman kedua
    Container(
      color: Colors.green,
      child: Center(
        child: Text('Halaman 2'),
      ),
    ),
    // Widget untuk halaman ketiga
    Container(
      color: Colors.yellow,
      child: Center(
        child: Text('Halaman 3'),
      ),
    ),
    // Widget untuk halaman keempat
    Container(
      color: Colors.red,
      child: Center(
        child: Text('Halaman 4'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigasi Bar'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Voucher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
