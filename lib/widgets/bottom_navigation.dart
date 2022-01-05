import 'package:flutter/material.dart';
import 'package:the_last_competition_apps/widgets/tab_item.dart';

// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _BottomNavigation();
// }

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    required this.currentTab,
    required this.onSelectTab,
  });

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

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
          onTap: (index) => onSelectTab(TabItem.values[index]),
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.explore_outlined,
              ),
              label: "Discover",
              tooltip: "",
            ),
            // const BottomNavigationBarItem(
            //   icon: SizedBox(
            //     width: 0,
            //     height: 0,
            //   ),
            //   label: "",
            // ),
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
