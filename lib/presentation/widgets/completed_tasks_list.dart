import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarafan_test/bloc/todo_bloc.dart';
import 'package:sarafan_test/models/todo.dart';

class CompletedTasksList extends StatelessWidget {
  final List<ToDo> tasksList;

  const CompletedTasksList({Key? key, required this.tasksList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          var task = tasksList[index];
          log("completed $task");
          return ListTile(
            title: Text(
              task.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            subtitle: Text(
              task.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            trailing: IconButton(
              onPressed: () {
                context.read<TodoBloc>().add(DeleteTask(task: task));
              },
              icon: const Icon(Icons.delete_outline_outlined),
            ),
          );
        },
      ),
    );
  }
}
