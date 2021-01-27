part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  final int count;
  CounterState(this.count);
  @override
  List<Object> get props => [count];
}

class CounterInitial extends CounterState {
  CounterInitial(int count) : super(count);
}

class CounterIncrement extends CounterState {
  CounterIncrement({int count}) : super(0);

  @override
  List<Object> get props => [count];
}

class CounterDecrement extends CounterState {
  CounterDecrement({int count}) : super(0);

  @override
  List<Object> get props => [count];
}

class CounterReset extends CounterState {
  CounterReset({int count}) : super(count);

  @override
  List<Object> get props => [count];
}

class CounterUpdate extends CounterState {
  CounterUpdate(int count) : super(count);

  @override
  List<Object> get props => [count];

  @override
  String toString() => 'Update String $count';
}
