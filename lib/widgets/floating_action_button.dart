import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAB extends StatefulWidget {
  const FAB({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FAB();
}

class _FAB extends State<FAB> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: Container(
        color: Colors.redAccent,
        padding: const EdgeInsets.all(8),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.filter_alt,
          ),
        ),
      ),
    );
  }
}
