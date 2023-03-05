import 'package:flutter/material.dart';
import 'package:my_todo_list/pages/atualizar/atualizar_tarefa.dart';
import 'package:my_todo_list/pages/listagem/listagem_view.dart';
import 'package:my_todo_list/pages/nova/nova_tarefa.dart';

rotasProvider(RouteSettings settings) {
  var name = settings.name ?? '';

  switch (name) {
    case '/':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => ListagemView(),
      );
    case '/nova-tarefa':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => NovaTarefa(),
      );
    case '/atualizar-tarefa':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => AtualizarTarefa(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => ListagemView(),
      );
  }
}
