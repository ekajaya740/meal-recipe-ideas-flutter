import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyElevatedButton extends StatefulWidget {
  final void Function()? onPressed;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(
          key: key,
        );
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _MyElevatedButton(
        onPressed: this.onPressed,
        child: this.child,
      );
}

class _MyElevatedButton extends State<MyElevatedButton> {
  final void Function()? onPressed;
  final Widget child;

  _MyElevatedButton({
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: child,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(0),
        minimumSize: const Size.fromHeight(60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
