import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfiniteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext buildContext, int index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(
                  '#1',
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ),
              ),
              title: Text(
                'Welcome to VMO Mart',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              isThreeLine: true,
              subtitle: Text('This is the product'),
            );
          }),
    ));
  }
}
