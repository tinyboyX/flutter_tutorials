import 'package:flutter/material.dart';

import 'category_item.dart';
import 'fake_data.dart';

class CategoriesPage extends StatelessWidget {
  static const String routeName = '/CategoriesPage';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(12),
      children: FAKE_CATEGORIES
          .map((eachCategory) => CategoryItem(category: eachCategory))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 3, //width / height
          crossAxisSpacing: 12,
          mainAxisSpacing: 12),
    );
  }
}
