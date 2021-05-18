import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/events/counter_events.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  //define "initial state" here
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    print(state); //this is "current state"
    //You must have UI to send Event(by pressing buttons)
    switch (event) {
      case CounterEvent.increment:
        var newState = state + 1;
        yield newState;
        break;
      case CounterEvent.decrement:
        var newState = state - 1;
        yield newState;
        break;
    }
  }
}
