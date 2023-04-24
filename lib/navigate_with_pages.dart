import 'package:flutter/material.dart';
import 'package:my_flutter_application/screens/home_screen.dart';
import 'package:my_flutter_application/screens/user_screen.dart';

class NavigateWithPages extends StatefulWidget {
  const NavigateWithPages({Key? key}) : super(key: key);

  @override
  State<NavigateWithPages> createState() => _NavigateWithPagesState();
}

class _NavigateWithPagesState extends State<NavigateWithPages> {
  late int currentIndex;
  late List<Widget> telas;

  List setAppBarSettings(index) {
    if (index == 0) {
      return ["Home", Colors.blue];
    } else {
      return ["User", Colors.purple];
    }
  }

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    telas = [
      const HomePage(),
      const UserScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(setAppBarSettings(currentIndex)[0]),
        backgroundColor: setAppBarSettings(currentIndex)[1],
      ),
      body: telas[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "User",
            backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
