import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    Color _color = this.category.color;
    return Container(
      child: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(this.category.content,
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ]),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [_color.withOpacity(0.1), _color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            color: _color,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
