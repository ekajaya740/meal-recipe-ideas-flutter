import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 24,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.explore_outlined,
              ),
              label: "Discover",
              tooltip: "",
            ),
            const BottomNavigationBarItem(
              icon: SizedBox(
                width: 0,
                height: 0,
              ),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.outdoor_grill),
              label: "Cookbook",
              tooltip: "",
            ),
          ],
        ),
      ),
    );
  }
}
