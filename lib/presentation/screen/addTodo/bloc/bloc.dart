import 'package:todolist/app/dl.dart';
import 'package:todolist/domain/usecase/hometodo_mark_usecase.dart';
import 'package:todolist/domain/usecase/todo_add_usecase.dart';
import 'package:todolist/domain/usecase/todo_edit_usecase.dart';

import 'event.dart';
import 'state.dart';
import 'package:bloc/bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoAddUseCase _useCase = instance<TodoAddUseCase>();
  final TodoEditUseCase _editUseCase = instance<TodoEditUseCase>();

  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      if (event is TodoAddEvent) {
        emit(TodoLoadingState('Please Wait...'));
        final response =
            await _useCase.execute(TodoAddUseCaseInput(event.todoData));
        response.fold((failure) => emit(TodoErrorState(failure.message)),
            (auth) {
          emit(TodoLoadedState(auth));
        });
      }
      if (event is TodoEditEvent) {
        emit(TodoLoadingState('Please Wait...'));
        final response =
            await _editUseCase.execute(TodoEditUseCaseInput(event.todoData));
        response.fold((failure) => emit(TodoErrorState(failure.message)),
            (auth) {
          emit(TodoLoadedState(auth));
        });
      }
    });
  }
}
