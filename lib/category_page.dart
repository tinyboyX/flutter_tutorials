import 'package:flutter/material.dart';

import 'category_item.dart';
import 'fake_data.dart';

class CategoriesPage extends StatelessWidget {
  static const String routeName = '/CategoryPage';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      children: FAKE_CATEGORIES
          .map((eachCategory) => CategoryItem(category: eachCategory))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 3 ,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
