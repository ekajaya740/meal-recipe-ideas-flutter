import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:the_last_competition_apps/widgets/my_elevated_button.dart';
import 'package:the_last_competition_apps/widgets/my_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar _appBar = AppBar(
      title: const MyText(
        "Discover Recipe",
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );

    Widget _navBar = Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 24,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
              tooltip: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.outdoor_grill),
              label: "Cookbook",
              tooltip: "",
            ),
          ],
        ),
      ),
    );

    Widget _fab = ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: Container(
        color: Colors.redAccent,
        padding: EdgeInsets.all(8),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.filter_alt,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: _appBar,
      bottomNavigationBar: _navBar,
      floatingActionButton: _fab,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                right: 16,
                left: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ),
            Card(
              child: Column(
                children: [
                  // Image.asset(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _rectClick({
    required Widget child,
    void Function()? onTap,
  }) {
    return InkWell(
      child: _rectRadius(
        child: child,
      ),
      onTap: onTap,
    );
  }

  ClipRRect _rectRadius({
    required Widget child,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: child,
    );
  }
}

enum _SelectedTab { home }
