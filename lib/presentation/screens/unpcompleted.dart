import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarafan_test/bloc/todo_bloc.dart';
import 'package:sarafan_test/models/todo.dart';
import 'package:sarafan_test/presentation/widgets/uncompleted_tasks_list.dart';

class Uncompleted extends StatefulWidget {
  const Uncompleted({Key? key}) : super(key: key);

  @override
  State<Uncompleted> createState() => _UncompletedState();
}

class _UncompletedState extends State<Uncompleted> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        List<ToDo> tasksList = state.allTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                backgroundColor: Colors.redAccent,
                label: Text(
                  '${state.allTasks.length} задач осталось',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            UnCompletedTasksList(
              tasksList: tasksList,
            ),
          ],
        );
      },
    );
  }
}
