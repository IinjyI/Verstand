import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verstand/Providers/NavBottomProvider.dart';
import 'package:verstand/Screens/AIDiagnosisScreen.dart';
import 'package:verstand/Screens/HomeScreen.dart';
import 'package:verstand/Screens/ProfileScreen.dart';

class NavBottomBar extends StatelessWidget {
  const NavBottomBar({Key? key}) : super(key: key);
  static const String id = 'NavBottomBar';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => NavBottomProvider(), child: NavBottom());
  }
}

class NavBottom extends StatelessWidget {
  NavBottom({
    super.key,
  });

  final _screens = [HomeScreen(), AIDiagnosisScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[Provider.of<NavBottomProvider>(context).selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: Consumer<NavBottomProvider>(builder: (_, value, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black26,
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            currentIndex: Provider.of<NavBottomProvider>(context).selectedIndex,
            onTap: (index) {
              Provider.of<NavBottomProvider>(context, listen: false)
                  .updateIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.image), label: 'AI diagnosis'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          );
        }),
      ),
    );
  }
}
