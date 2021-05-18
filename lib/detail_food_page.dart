import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Center(
        child: Text("Food's Detail"),
      ),
    );
  }
}
