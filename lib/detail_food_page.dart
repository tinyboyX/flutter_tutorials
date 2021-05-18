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
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Ingredients',
              style: TextStyle(fontSize: 30, color: Colors.deepOrange),
            ),
          ),
          Expanded(
              child: food.ingredients != null
                  ? ListView.builder(
                      itemCount: food.ingredients.length,
                      itemBuilder: (context, index) {
                        String ingredients = this.food.ingredients[index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text('#${index + 1}'),
                          ),
                          title: Text(
                            ingredients,
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      })
                  : Text(
                      'No ingredients for ${food.name}',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ))
        ],
      ),
    );
  }
}
