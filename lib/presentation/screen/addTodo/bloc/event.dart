import 'package:equatable/equatable.dart';
import 'package:todolist/models/todo_time.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class TodoAddEvent extends TodoEvent {
  final TodoData todoData;
  const TodoAddEvent({required this.todoData});

  @override
  List<Object> get props => [todoData];

  //,context];

  @override
  String toString() {
    return 'TodoTodoEvent{ $todoData}';
  }
}

class TodoEditEvent extends TodoEvent {
  final TodoData todoData;
  const TodoEditEvent({required this.todoData});

  @override
  List<Object> get props => [];

  //,context];

  @override
  String toString() {
    return 'TodoEditEvent{ $todoData}';
  }
}

class TodoTodoMarkEvent extends TodoEvent {
  final String dt;
  final TodoData todoDat;
  const TodoTodoMarkEvent({required this.dt, required this.todoDat});

  @override
  List<Object> get props => [dt];

  //,context];

  @override
  String toString() {
    return 'TodoTodoDeleteEvent{ $dt}';
  }
}
