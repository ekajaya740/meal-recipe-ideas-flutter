import 'dart:convert';

// import 'package:flutter_secure_file_storage/flutter_secure_file_storage.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_last_competition_apps/models/meals_model.dart';
import 'http_provider.dart';

class RandomMealProvider {
  // final storage = FlutterSecureFileStorage(FlutterSecureStorage());
  final HTTPProvider _httpProvider = HTTPProvider();
  // int _keyIndex = 0;

  static final RandomMealProvider _instance = RandomMealProvider._internal();

  final BehaviorSubject<List<MealsModel>> mealsBrowsed =
      BehaviorSubject<List<MealsModel>>();

  final BehaviorSubject<bool> browsedLoading =
      BehaviorSubject<bool>.seeded(false);

  RandomMealProvider._internal();

  factory RandomMealProvider() => _instance;

  void _maybeBrowseMore() {
    List<MealsModel> _browsed = mealsBrowsed.value;

    if (_browsed.length <= 3) {
      browseMeals();
    }
  }

  Future<List<MealsModel>> browseMoreMeals() async {
    List<MealsModel> _meals = [];
    const String _uriRandomMeal =
        'https://www.themealdb.com/api/json/v2/1/randomselection.php';

    String _res = await _httpProvider.httpAccess(uri: _uriRandomMeal);
    var _decode = jsonDecode(_res)['meals'];
    List<dynamic> _mealList = _decode;
    for (int i = 0; i < _mealList.length; i++) {
      MealsModel _meal = MealsModel.fromJson(_mealList[i]);
      _meals.add(_meal);
    }

    return _meals;
  }

  Future<void> browseMeals() async {
    browsedLoading.add(true);
    List<MealsModel> _meals = await browseMoreMeals();
    _addMoreMealsToQueue(_meals);
    browsedLoading.add(false);
  }

  void _addMoreMealsToQueue(List<MealsModel> browsed) {
    List<MealsModel> mealsInList = mealsBrowsed.valueOrNull ?? <MealsModel>[];
    mealsBrowsed.add(browsed + mealsInList);
  }

  void _removeFromBrowsedMealsByIndex(int swipedOn) {
    List<MealsModel> browsed = mealsBrowsed.value;
    browsed.removeAt(swipedOn);
    mealsBrowsed.add(browsed);
    _maybeBrowseMore();
  }

  Future<void> swipeLeft(int index, MealsModel meal) async {
    assert(mealsBrowsed.valueOrNull != null);
    _removeFromBrowsedMealsByIndex(index);
    print("Swipe Left");
  }

  Future<void> swipeRight(int index, MealsModel meal) async {
    // _keyIndex = await storage.read(key: 'index') ?? 0;
    assert(mealsBrowsed.valueOrNull != null);
    // await storage.write(key: 'Meals + ${0}', value: meal);
    _removeFromBrowsedMealsByIndex(index);
    // _keyIndex++;
    print("Swipe Right");
  }
}
