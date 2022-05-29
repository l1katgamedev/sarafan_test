import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarafan_test/bloc/todo_bloc.dart';
import 'package:sarafan_test/models/todo.dart';
import 'package:sarafan_test/presentation/widgets/completed_tasks_list.dart';

class Completed extends StatefulWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        List<ToDo> tasksList = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                backgroundColor: Colors.greenAccent,
                label: Text(
                  '${state.completedTasks.length} задач сделано',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CompletedTasksList(
              tasksList: tasksList,
            ),
          ],
        );
      },
    );
  }
}
