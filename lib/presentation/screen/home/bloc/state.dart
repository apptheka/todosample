import 'package:equatable/equatable.dart';
import 'package:todolist/models/todo_time.dart';

abstract class HomeTodoState extends Equatable {
  const HomeTodoState();
}

class HomeTodoInitial extends HomeTodoState {
  @override
  List<Object> get props => [];
}

class HomeTodoUiInitial extends HomeTodoState {
  @override
  List<Object> get props => [];
}

class HomeTodoLoadingState extends HomeTodoState {
  final String loadingStatus;

  HomeTodoLoadingState(this.loadingStatus);
  @override
  // TODO: implement props
  List<Object?> get props => [loadingStatus];
}

class HomeTodoErrorState extends HomeTodoState {
  final String message;

  HomeTodoErrorState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class HomeTodoLoadedState extends HomeTodoState {
  final List<TodoData> data;

  HomeTodoLoadedState(this.data);
  @override
  List<Object?> get props => [data];
}
