import 'package:todolist/app/dl.dart';
import 'package:todolist/domain/usecase/hometodo_delete_usecase.dart';
import 'package:todolist/domain/usecase/hometodo_mark_usecase.dart';
import 'package:todolist/domain/usecase/hometodolist_usecase.dart';

import './event.dart';
import './state.dart';
import 'package:bloc/bloc.dart';

class HomeTodoBloc extends Bloc<HomeEvent, HomeTodoState> {
  final HomeTodoListUseCase _useCase = instance<HomeTodoListUseCase>();
  final HomeTodoDeleteUseCase _deleteUseCase =
      instance<HomeTodoDeleteUseCase>();
  final HomeTodoMarkUseCase _markUseCase = instance<HomeTodoMarkUseCase>();
  HomeTodoBloc() : super(HomeTodoInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeTodoEvent) {
        emit(HomeTodoLoadingState('Please Wait...'));
        final response =
            await _useCase.execute(HomeTodoListUseCaseInput(event.dt));
        response.fold((failure) => emit(HomeTodoErrorState(failure.message)),
            (auth) {
          emit(HomeTodoLoadedState(auth));
        });
      }
      if (event is HomeTodoDeleteEvent) {
        emit(HomeTodoLoadingState('Please Wait...'));
        final response = await _deleteUseCase
            .execute(HomeTodoDeleteUseCaseInput(event.dt, event.todoDat));
        response.fold((failure) => emit(HomeTodoErrorState(failure.message)),
            (auth) {
          emit(HomeTodoLoadedState(auth));
        });
      }

      if (event is HomeTodoMarkEvent) {
        emit(HomeTodoLoadingState('Please Wait...'));
        final response = await _markUseCase
            .execute(HomeTodoMarkUseCaseInput(event.dt, event.todoDat));
        response.fold((failure) => emit(HomeTodoErrorState(failure.message)),
            (auth) {
          emit(HomeTodoLoadedState(auth));
        });
      }
    });
  }
}
