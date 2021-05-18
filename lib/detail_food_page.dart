import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/models/food.dart';

class DetailFoodPage extends StatelessWidget {
  final Food food;

  DetailFoodPage({this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: FadeInImage.assetNetwork(
                placeholder: 'assert/images/loading.gif', image: food.urlImage),
          ),
          Text("${food.ingredients}"),
          Expanded(
              child: ListView.builder(
                  itemCount: food.ingredients.length,
                  itemBuilder: (context, index) {
                    String ingredients = this.food.ingredients[index];
                    return ListTile(
                      leading: Text('$index'),
                      title: Text(
                        ingredients,
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  })
          )
        ],
      ),
    );
  }
}
