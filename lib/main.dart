import 'package:flutter/material.dart';
import 'package:my_todo_list/get_it_provider.dart';
import 'package:my_todo_list/services/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    registrarDependencias();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (settings) => rotasProvider(settings),
    );
  }
}
