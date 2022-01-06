// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:the_last_competition_apps/widgets/my_text.dart';

// class CookbookScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _CookbookScreen();
// }

// class _CookbookScreen extends State<CookbookScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Widget _gridChild() {
//       return Card(
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         child: Stack(
//           // alignment: AlignmentDirectional.topStart,
//           children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             color: Colors.grey,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//             MyText("MealsTags"),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//               MyText("MealsName"),
//               MyText("MealsArea" + "MealsCategory"),
//             ])
//           ]),
//         ]),
//       );
//     }

//     return GridView(
//       controller: ScrollController(),
//       physics: BouncingScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisExtent: 240,
//       ),
//       children: [
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//         _gridChild(),
//       ],
//     );
//   }
// }
