import 'package:dartz/dartz.dart';
import 'package:todolist/data/network/failure.dart';
import 'package:todolist/domain/repository/home_todo_repository.dart';
import 'package:todolist/domain/usecase/base_usecase.dart';
import 'package:todolist/models/todo_time.dart';

class HomeTodoDeleteUseCase
    implements BaseUseCase<HomeTodoDeleteUseCaseInput, List<TodoData>> {
  final HomeTodoRepository _repository;

  HomeTodoDeleteUseCase(this._repository);

  @override
  Future<Either<Failure, List<TodoData>>> execute(
      HomeTodoDeleteUseCaseInput input) async {
    return _repository.delete(input.dt, input.data);
  }
}

class HomeTodoDeleteUseCaseInput {
  String dt;
  TodoData data;
  HomeTodoDeleteUseCaseInput(this.dt, this.data);
}
