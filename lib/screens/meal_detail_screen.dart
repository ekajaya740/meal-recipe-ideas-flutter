import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_last_competition_apps/widgets/my_text.dart';

class MealDetailScreen extends StatefulWidget {
  final String imgSrc;
  final String title;
  final String area;
  final String category;
  final List<String> ingredients;
  final List<String> measures;
  final String instruction;
  final String tags;
  final String strYoutube;

  MealDetailScreen({
    required this.imgSrc,
    required this.title,
    required this.area,
    required this.category,
    required this.ingredients,
    required this.measures,
    required this.instruction,
    required this.tags,
    required this.strYoutube,
  });

  @override
  State<StatefulWidget> createState() => _MealDetailScreen(
        imgSrc: imgSrc,
        title: title,
        area: area,
        category: category,
        ingredients: ingredients,
        measures: measures,
        instruction: instruction,
        tags: tags,
        strYoutube: strYoutube,
      );
}

class _MealDetailScreen extends State<MealDetailScreen> {
  final String imgSrc;
  final String title;
  final String area;
  final String category;
  final List<String> ingredients;
  final List<String> measures;
  final String instruction;
  final String tags;
  final String strYoutube;

  int _trueIngredientCount = 0;
  late final List<bool> visible;
  List<String> tagsList = List.empty(
    growable: true,
  );

  _MealDetailScreen({
    required this.imgSrc,
    required this.title,
    required this.area,
    required this.category,
    required this.ingredients,
    required this.measures,
    required this.instruction,
    required this.tags,
    required this.strYoutube,
  });

  @override
  void initState() {
    super.initState();

    visible = List.empty(
      growable: true,
    );

    for (int i = 0; i < ingredients.length; i++) {
      if (ingredients[i] == "") {
        visible.add(false);
      } else {
        _trueIngredientCount = _trueIngredientCount + 1;
        visible.add(true);
      }
    }

    if (tags != "") tagsList = tags.split(",");
  }

  @override
  Widget build(BuildContext context) {
    Widget _tagBubble(String tag) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Colors.white,
            width: .7,
          ),
        ),
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: MyText(
            tag,
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    }

    Widget _ingredientCard(bool visible, String ingredient, String measure) {
      return Visibility(
        maintainAnimation: visible,
        visible: visible,
        maintainState: visible,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.black38,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: MyText(
                      "$ingredient",
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: MyText(
                      "$measure",
                      softWrap: false,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      extendBodyBehindAppBar: true,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();

          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Image.network(
                      imgSrc,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 4,
                    ),
                    child: SafeArea(
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(
                          left: 16,
                        ),
                        padding: EdgeInsets.all(
                          2,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: .7,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              size: 16,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, bottom: 8),
                        child: Wrap(
                          children: [
                            for (int i = 0; i < tagsList.length; i++)
                              _tagBubble(tagsList[i]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                        left: 6,
                        right: 6,
                      ),
                      child: MyText(
                        title,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                        left: 6,
                        right: 6,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            "Ingredients",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          MyText(
                            "$_trueIngredientCount Items",
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ],
                      ),
                    ),
                    for (int i = 0; i < ingredients.length; i++)
                      _ingredientCard(
                        visible[i],
                        ingredients[i],
                        measures[i],
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 4,
                        left: 4,
                        right: 4,
                      ),
                      child: MyText(
                        "Instructions",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 4,
                        right: 4,
                      ),
                      child:
                    MyText(
                      "$instruction",
                      maxLines: 100,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.justify,
                    ),),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
