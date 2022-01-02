import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:the_last_competition_apps/models/meals_model.dart';
import 'package:the_last_competition_apps/providers/random_meal_provider.dart';
import 'package:the_last_competition_apps/widgets/my_elevated_button.dart';
import 'package:the_last_competition_apps/widgets/my_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
              icon: Icon(
                Icons.explore_outlined,
              ),
              label: "Discover",
              tooltip: "",
            ),
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
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 0,
                height: 0,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );

    Widget _fab = ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: Container(
        color: Colors.redAccent,
        padding: const EdgeInsets.all(8),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.filter_alt,
          ),
        ),
      ),
    );

    ClipRRect _rectRadius({
      required Widget child,
    }) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: child,
      );
    }

    // InkWell _rectClick({
    //   required Widget child,
    //   void Function()? onTap,
    // }) {
    //   return InkWell(
    //     child: _rectRadius(
    //       child: child,
    //     ),
    //     onTap: onTap,
    //   );
    // }

    Widget _mealCard() {
      return Card(
        child: FutureBuilder(
          // initialData: _getRandomMeal(),
          future: _getRandomMeal(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(_meals.strMeal);
              return Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  children: [
                    Image.network(_meals.strMealThumb!, width: 100, height: 100),
                  ],
                ),
              );
            }
            return Skeleton(
              isLoading: _isLoading,
              skeleton: SkeletonListTile(),
              child: Column(
                children: [
                  // Image.asset(_meals.strMealThumb!),
                ],
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: _appBar,
      bottomNavigationBar: _navBar,
      floatingActionButton: _fab,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _mealCard(),
            ),
          ],
        ),
      ),
    );
  }
}
