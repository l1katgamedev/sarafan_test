import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarafan_test/bloc/todo_bloc.dart';

import 'presentation/screens/home.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sarafan Test',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const Scaffold(body: HomeScreen()),
      ),
    );
    ;
  }
}
