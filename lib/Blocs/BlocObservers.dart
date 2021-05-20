import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObservers extends BlocObserver{
    @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}