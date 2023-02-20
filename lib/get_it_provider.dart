import 'package:get_it/get_it.dart';
import 'package:my_todo_list/pages/listagem/listagem_controller.dart';
import 'package:my_todo_list/repositories/todo_repository.dart';

var serviceDependency = GetIt.instance;
registrarDependencias() {
  serviceDependency.registerFactory(
    () => TodoRepository(),
  );

  serviceDependency.registerFactory(
    () => ListagemController(
      repository: serviceDependency.get<TodoRepository>(),
    ),
  );
}
