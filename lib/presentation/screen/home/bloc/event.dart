import 'package:equatable/equatable.dart';
import 'package:todolist/models/todo_time.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeTodoEvent extends HomeEvent {
  final String dt;
  const HomeTodoEvent({required this.dt});

  @override
  List<Object> get props => [dt];

  //,context];

  @override
  String toString() {
    return 'HomeTodoEvent{ $dt}';
  }
}

class HomeTodoDeleteEvent extends HomeEvent {
  final String dt;
  final TodoData todoDat;
  const HomeTodoDeleteEvent({required this.dt, required this.todoDat});

  @override
  List<Object> get props => [dt];

  //,context];

  @override
  String toString() {
    return 'HomeTodoDeleteEvent{ $dt}';
  }
}

class HomeTodoMarkEvent extends HomeEvent {
  final String dt;
  final TodoData todoDat;
  const HomeTodoMarkEvent({required this.dt, required this.todoDat});

  @override
  List<Object> get props => [dt];

  //,context];

  @override
  String toString() {
    return 'HomeTodoDeleteEvent{ $dt}';
  }
}
