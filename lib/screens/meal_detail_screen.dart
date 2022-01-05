import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_last_competition_apps/widgets/my_text.dart';

// class MealDetailScreen extends StatefulWidget {
//   final String imgSrc;
//   final String title;

//   MealDetailScreen({
//     required this.imgSrc,
//     required this.title,
//   });

//   @override
//   State<StatefulWidget> createState() => _MealDetailScreen(
//         imgSrc: imgSrc,
//         title: title,
//       );
// }

class MealDetailScreen extends StatelessWidget {
  final String imgSrc;
  final String title;
  final String area;
  final String category;

  MealDetailScreen({
    required this.imgSrc,
    required this.title,
    required this.area,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    AppBar _appBar = AppBar(
      centerTitle: true,
      backgroundColor: Colors.black12,
      title: MyText(
        title,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        overflow: TextOverflow.ellipsis,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: _appBar,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imgSrc,
            ),
            Row(
              children: [
                MyText(area + " "),
                MyText(category),
              ],
            ),
            MyText("Ingredient"),
            for (int i = 0; i < 30; i++) MyText("text"),
          ],
        ),
      ),
    );
  }
}
