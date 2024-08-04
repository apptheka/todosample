import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todolist/data/data_source/binding/local/binding_local.dart';
import 'package:todolist/data/network/network_info.dart';
import 'package:todolist/data/repository/home_todo_repository.dart';
import 'package:todolist/domain/repository/home_todo_repository.dart';
import 'package:todolist/domain/usecase/hometodo_delete_usecase.dart';
import 'package:todolist/domain/usecase/hometodo_mark_usecase.dart';
import 'package:todolist/domain/usecase/hometodolist_usecase.dart';
import 'package:todolist/domain/usecase/todo_add_usecase.dart';
import 'package:todolist/domain/usecase/todo_edit_usecase.dart';
import '../data/data_source/binding/remote/binding_remote.dart';
import '../data/data_source/datasource_factory.dart';
import 'package:get_it/get_it.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<HomeTodoRepository>(
      () => HomeTodoRepositoryImpl(instance()));
  // binding remote data source
  instance.registerLazySingleton<BindingRemote>(
      () => BindingRemoteImpl(instance(), instance()));
  instance.registerLazySingleton<BindingLocal>(() => BindingLocalImpl());

  instance.registerFactory<BindingDataSourceFactory>(
    () => BindingDataSourceFactory(
        bindingRemote: instance(), bindingLocal: instance()),
  );
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeTodoListUseCase>()) {
    instance.registerFactory<HomeTodoListUseCase>(
        () => HomeTodoListUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<HomeTodoDeleteUseCase>()) {
    instance.registerFactory<HomeTodoDeleteUseCase>(
        () => HomeTodoDeleteUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<HomeTodoMarkUseCase>()) {
    instance.registerFactory<HomeTodoMarkUseCase>(
        () => HomeTodoMarkUseCase(instance()));
  }

  if (!GetIt.I.isRegistered<TodoAddUseCase>()) {
    instance.registerFactory<TodoAddUseCase>(() => TodoAddUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<TodoEditUseCase>()) {
    instance
        .registerFactory<TodoEditUseCase>(() => TodoEditUseCase(instance()));
  }
}
