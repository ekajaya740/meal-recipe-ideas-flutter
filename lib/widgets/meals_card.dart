import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class MealsCard extends StatefulWidget {
  final Widget child;
  final Function(Offset)? onSwipeLeft;
  final Function(Offset)? onSwipeRight;
  final bool? horizontalSwipe;
  // final double opacity;
  final void Function(DragUpdateDetails)? onPositionChanged;
  final void Function()? onTap;

  MealsCard({
    Key? key,
    required this.child,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.horizontalSwipe,
    this.onPositionChanged,
    // required this.opacity,
    this.onTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MealsCard(
        child: child,
        onSwipeLeft: onSwipeLeft,
        onSwipeRight: onSwipeRight,
        horizontalSwipe: horizontalSwipe,
        onPositionChanged: onPositionChanged,
        onTap: onTap,
        // opacity: opacity,
      );
}

class _MealsCard extends State<MealsCard> {
  final Widget child;
  final Function(Offset)? onSwipeLeft;
  final Function(Offset)? onSwipeRight;
  final bool? horizontalSwipe;
  final void Function(DragUpdateDetails)? onPositionChanged;
  final void Function()? onTap;
  // final double opacity;

  _MealsCard({
    required this.child,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.horizontalSwipe,
    // required this.opacity,
    this.onTap,
    this.onPositionChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      child: Swipable(
        onPositionChanged: onPositionChanged,
        onSwipeLeft: onSwipeLeft,
        onSwipeRight: onSwipeRight,
        horizontalSwipe: horizontalSwipe ?? true,
        verticalSwipe: false,
        child: Stack(
          children: [
            InkWell(
              onTap: onTap,
              child: Card(
                elevation: .5,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    side: BorderSide(
                      color: Colors.black12,
                      width: .7,
                    )),
                child: child,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: Container(
                  // color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
//   padding: EdgeInsets.only(
//     top: 8,
//     left: 24,
//     right: 12,
//     bottom: MediaQuery.of(context).padding.bottom + 14,
//   ),
//   child: ClipRRect(
//     borderRadius: BorderRadius.circular(_radius),
//     child: Container(
//       color: Colors.white60,
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//     ),
//   ),
// ),
// Padding(
//   padding: EdgeInsets.only(
//     top: 10,
//     left: 28,
//     right: 8,
//     bottom: MediaQuery.of(context).padding.bottom + 8,
//   ),
//   child: ClipRRect(
//     borderRadius: BorderRadius.circular(_radius),
//     child: Container(
//       color: Colors.white30,
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//     ),
//   ),
// ),
