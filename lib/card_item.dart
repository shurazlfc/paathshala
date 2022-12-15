import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoriesItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoriesItem({super.key, required this.title, required this.color});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(title),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}