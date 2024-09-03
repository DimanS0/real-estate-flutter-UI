import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/tips');
        break;
      case 2:
        Navigator.pushNamed(context, '/favorite');
        break;
      case 3:
        Navigator.pushNamed(context, '/cart');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.lightbulb),
          label: 'Tips',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.heart),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
