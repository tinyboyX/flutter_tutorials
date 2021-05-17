import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/models/category.dart';

// ignore: must_be_immutable
class FoodPage extends StatelessWidget {
  static const String routeName = '/FoodPage';
  Category category;

  FoodPage({this.category});

  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    this.category = arguments['category'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Food\'s from ${category.content}'),
      ),
      body: Center(
        child: Text(category.content),
      ),
    );
  }
}
