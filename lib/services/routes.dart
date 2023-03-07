import 'package:flutter/material.dart';
import 'package:my_todo_list/pages/atualizar/atualizar_tarefa.dart';
import 'package:my_todo_list/pages/detalhes/detalhes_view.dart';
import 'package:my_todo_list/pages/listagem/listagem_view.dart';
import 'package:my_todo_list/pages/nova/nova_tarefa_view.dart';

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
        builder: (context) => NovaTarefaView(),
      );
    case '/atualizar-tarefa':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => AtualizarTarefa(),
      );
    case '/detalhes-tarefa':
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => DetalhesTarefaView(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => ListagemView(),
      );
  }
}
