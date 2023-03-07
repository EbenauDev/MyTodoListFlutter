import 'package:flutter/material.dart';

class NovaTarefaView extends StatefulWidget {
  const NovaTarefaView({super.key});

  @override
  State<NovaTarefaView> createState() => NovaTarefaState();
}

class NovaTarefaState extends State<NovaTarefaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova tarefa')),
    );
  }
}