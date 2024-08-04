import 'package:equatable/equatable.dart';
import 'package:todolist/models/todo_time.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoUiInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadingState extends TodoState {
  final String loadingStatus;

  TodoLoadingState(this.loadingStatus);
  @override
  // TODO: implement props
  List<Object?> get props => [loadingStatus];
}

class TodoErrorState extends TodoState {
  final String message;

  TodoErrorState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class TodoLoadedState extends TodoState {
  final List<TodoData> data;

  TodoLoadedState(this.data);
  @override
  List<Object?> get props => [data];
}
