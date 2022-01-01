import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:the_last_competition_apps/widgets/my_elevated_button.dart';
import 'package:the_last_competition_apps/widgets/my_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  final bool _isDarkMode = false;
  // final String _user;

  @override
  Widget build(BuildContext context) {
    AppBar _appBar = AppBar(
      title: const MyText(
        "Discover Recipe",
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter_alt,
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: _appBar,
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
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: _rectRadius(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: MyElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Icon(
                                    Icons.history,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const MyText(
                                    "Swipe History",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: MyElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Icon(
                                    Icons.outdoor_grill,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const MyText(
                                    "Cookbook",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
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
