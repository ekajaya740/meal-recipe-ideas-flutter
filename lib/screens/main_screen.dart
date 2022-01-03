import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:the_last_competition_apps/models/meals_model.dart';
import 'package:the_last_competition_apps/widgets/bottom_navigation.dart';
import 'package:the_last_competition_apps/widgets/floating_action_button.dart';
import 'package:the_last_competition_apps/widgets/my_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'bottom_nav_bar_tabs/discover_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  final String _httpRandom =
      'http://www.themealdb.com/api/json/v1/1/random.php';

  late MealsModel _meals;

  Future<MealsModel> _getRandomMeal() async {
    var _res = await http.get(Uri.parse(_httpRandom));
    var _decode = jsonDecode(_res.body)['meals'];
    List<dynamic> _mealsList = _decode;
    _meals = MealsModel.fromJson(_mealsList[0]);
    return _meals;
  }

  @override
  void initState() {
    super.initState();
    _getRandomMeal();
  }

  final bool _isLoading = true;

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

    Widget _navBar = const BottomNavigation();

    Widget _fab = const FAB();

    Widget _mealCard() {
      const double _paddingLR = 16;
      const double _paddingTB = 10;
      const double _radius = 20;
      return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radius)),
        child: FutureBuilder(
          future: _getRandomMeal(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(_radius)),
                        child: Image.network(
                          _meals.strMealThumb!,
                          width: MediaQuery.of(context).size.width,
                          height: 280,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: _paddingLR,
                            right: _paddingLR,
                            bottom: _paddingTB,
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: MyText(
                              _meals.strMeal!,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: _paddingLR,
                      right: _paddingLR,
                      top: 4,
                    ),
                    child: MyText(
                      "Instructions",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: _paddingLR,
                      right: _paddingLR,
                      top: 2,
                      bottom: 8,
                    ),
                    child: MyText(
                      _meals.strInstructions!,
                      fontSize: 14,
                      overflow: TextOverflow.fade,
                      maxLines: 11,
                      textAlign: TextAlign.justify,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(
                  isLoading: _isLoading,
                  skeleton: SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: MediaQuery.of(context).size.width,
                      height: 280,
                    ),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(_radius)),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 280,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black12,
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: _paddingLR,
                            right: _paddingLR,
                            bottom: _paddingTB,
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: SkeletonLine(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SkeletonLine(
                  style: SkeletonLineStyle(
                    padding: EdgeInsets.only(
                      left: _paddingLR,
                      right: _paddingLR,
                      top: 4,
                    ),
                    width: 100,
                    height: 16,
                  ),
                ),
                SkeletonParagraph(
                  style: const SkeletonParagraphStyle(
                    lines: 9,
                    spacing: 2,
                    padding: EdgeInsets.only(
                      left: _paddingLR,
                      right: _paddingLR,
                      top: 4,
                      bottom: 8,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: _appBar,
      bottomNavigationBar: _navBar,
      floatingActionButton: _fab,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).padding.bottom + 32,
            ),
            child: Expanded(
              child: DiscoverScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
