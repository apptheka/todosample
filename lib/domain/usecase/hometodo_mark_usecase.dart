import 'package:dartz/dartz.dart';
import 'package:todolist/data/network/failure.dart';
import 'package:todolist/domain/repository/home_todo_repository.dart';
import 'package:todolist/domain/usecase/base_usecase.dart';
import 'package:todolist/models/todo_time.dart';

class HomeTodoMarkUseCase
    implements BaseUseCase<HomeTodoMarkUseCaseInput, List<TodoData>> {
  final HomeTodoRepository _repository;

  HomeTodoMarkUseCase(this._repository);

  @override
  Future<Either<Failure, List<TodoData>>> execute(
      HomeTodoMarkUseCaseInput input) async {
    return _repository.markTodo(input.dt, input.data);
  }
}

class HomeTodoMarkUseCaseInput {
  String dt;
  TodoData data;
  HomeTodoMarkUseCaseInput(this.dt, this.data);
}
