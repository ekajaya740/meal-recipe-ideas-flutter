import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:the_last_competition_apps/models/meals_model.dart';
import 'package:the_last_competition_apps/providers/random_meals_provider.dart';
import 'package:the_last_competition_apps/screens/meal_detail_screen.dart';
import 'package:the_last_competition_apps/widgets/meals_card.dart';
import 'package:the_last_competition_apps/widgets/my_text.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DiscoverScreen();
}

class _DiscoverScreen extends State<DiscoverScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    RandomMealProvider().browseMeals();
  }

  final bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    const double _paddingLR = 16;
    const double _paddingTB = 10;
    const double _radius = 20;

    double _opacity = 0;

    Widget _cardLoadingView() {
      return MealsCard(
        // opacity: 0,
        horizontalSwipe: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton(
              isLoading: _isLoading,
              skeleton: SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(_radius),
                  ),
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                    right: 8,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                ),
              ),
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
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
                lines: 14,
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
        ),
      );
    }

    Widget _hasDataView(int index, MealsModel meal) {
      // print(_opacity);
      return MealsCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealDetailScreen(
                imgSrc: meal.strMealThumb!,
                title: meal.strMeal!,
                area: meal.strArea!,
                category: meal.strCategory!,
                ingredients: [
                  meal.strIngredient1 ?? "",
                  meal.strIngredient2 ?? "",
                  meal.strIngredient3 ?? "",
                  meal.strIngredient4 ?? "",
                  meal.strIngredient5 ?? "",
                  meal.strIngredient6 ?? "",
                  meal.strIngredient7 ?? "",
                  meal.strIngredient8 ?? "",
                  meal.strIngredient9 ?? "",
                  meal.strIngredient10 ?? "",
                  meal.strIngredient11 ?? "",
                  meal.strIngredient12 ?? "",
                  meal.strIngredient13 ?? "",
                  meal.strIngredient14 ?? "",
                  meal.strIngredient15 ?? "",
                  meal.strIngredient16 ?? "",
                  meal.strIngredient17 ?? "",
                  meal.strIngredient18 ?? "",
                  meal.strIngredient19 ?? "",
                  meal.strIngredient20 ?? "",
                ],
                measures: [
                  meal.strMeasure1 ?? "",
                  meal.strMeasure2 ?? "",
                  meal.strMeasure3 ?? "",
                  meal.strMeasure4 ?? "",
                  meal.strMeasure5 ?? "",
                  meal.strMeasure6 ?? "",
                  meal.strMeasure7 ?? "",
                  meal.strMeasure8 ?? "",
                  meal.strMeasure9 ?? "",
                  meal.strMeasure10 ?? "",
                  meal.strMeasure11 ?? "",
                  meal.strMeasure12 ?? "",
                  meal.strMeasure13 ?? "",
                  meal.strMeasure14 ?? "",
                  meal.strMeasure15 ?? "",
                  meal.strMeasure16 ?? "",
                  meal.strMeasure17 ?? "",
                  meal.strMeasure18 ?? "",
                  meal.strMeasure19 ?? "",
                  meal.strMeasure20 ?? "",
                ],
                instruction: meal.strInstructions!,
                tags: meal.strTags ?? "",
                strYoutube: meal.strYoutube ?? "",
              ),
            ),
          );
        },
        onPositionChanged: (change) {
          // setState(() {
          _opacity += 10;
          // });
        },
        // opacity: _opacity,
        onSwipeLeft: (finalPosition) {
          RandomMealProvider().swipeLeft(index, meal);
        },
        onSwipeRight: (finalPosition) {
          RandomMealProvider().swipeRight(index, meal);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 8,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(_radius),
                    ),
                    child: Image.network(
                      meal.strMealThumb!,
                      width: MediaQuery.of(context).size.width,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 12,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: _paddingTB,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: MyText(
                        meal.strMeal!,
                        color: Colors.white,
                        fontSize: 20,
                        maxLines: 2,
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
                top: 10,
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
                meal.strInstructions!,
                fontSize: 14,
                overflow: TextOverflow.fade,
                maxLines: 16,
                textAlign: TextAlign.justify,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      );
    }

    return StreamBuilder<List<MealsModel>>(
      stream: RandomMealProvider().mealsBrowsed,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _cardLoadingView();
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return const Expanded(
            child: Center(
              child: MyText(
                "No data :(",
              ),
            ),
          );
        }

        final meals = snapshot.data ?? <MealsModel>[];

        return SizedBox(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: meals.asMap().entries.map(
              (entry) {
                final index = entry.key;
                final meal = entry.value;

                if (index - 1 >= 0) {
                  double pr = index * 1.1;
                  return Padding(
                      padding: EdgeInsets.only(
                        right: pr,
                      ),
                      child: _hasDataView(index, meal));
                }

                return _hasDataView(index, meal);
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
