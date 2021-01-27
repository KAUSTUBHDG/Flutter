part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  final int count;
  CounterEvent(this.count);
  List<Object> get props => [count];
}

class IncrementEvent extends CounterEvent {
  IncrementEvent(int count) : super(count);
  @override
  List<Object> get props => [count];
}

class DecrementEvent extends CounterEvent {
  DecrementEvent(int count) : super(count);
  @override
  List<Object> get props => [count];
}

class ResetEvent extends CounterEvent {
  ResetEvent(int count) : super(count);
  @override
  List<Object> get props => [count];
}
