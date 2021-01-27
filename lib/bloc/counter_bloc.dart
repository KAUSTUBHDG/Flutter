import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    int count = state.count;
    if (event is IncrementEvent) {
      yield CounterIncrement(count: count++);
    }
    if (event is DecrementEvent) {
      yield CounterDecrement(count: count <= 0 ? count = 0 : count--);
    }
    if (event is ResetEvent) {
      yield CounterReset(count: (count = 0));
    }
    yield CounterUpdate(count);
  }
}
