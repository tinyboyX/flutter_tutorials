import 'package:flutter_tutorials/ui/counter_page.dart';

import 'blocs/counter_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Stream<int> aStreamFuction() async* {
    yield 2;
    yield 4;
    yield 8;
  }

  //Now we need to install bloc
  //We have 2 Events => Increase / Descrease
  @override
  Widget build(BuildContext context) {
    final result = this.aStreamFuction();
    result.forEach((element) {
      print(element);
    });
    return MaterialApp(
        title: 'Increment / Decrement Counter App using Bloc',
        home: BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
          child: CounterPage(),
        ));
  }
}
