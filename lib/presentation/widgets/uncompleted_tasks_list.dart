import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarafan_test/bloc/todo_bloc.dart';
import 'package:sarafan_test/models/todo.dart';
import 'package:sarafan_test/presentation/screens/task_detail.dart';

class UnCompletedTasksList extends StatefulWidget {
  final List<ToDo> tasksList;

  const UnCompletedTasksList({Key? key, required this.tasksList})
      : super(key: key);

  @override
  State<UnCompletedTasksList> createState() => _UnCompletedTasksListState();
}

class _UnCompletedTasksListState extends State<UnCompletedTasksList> {
  void _completeTask(BuildContext context, ToDo task) {
    if (task.isDone == false) {
      context.read<TodoBloc>().add(CompleteTask(task: task));
      context.read<TodoBloc>().add(UpdateTask(task: task));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.tasksList.length,
        itemBuilder: (context, index) {
          var task = widget.tasksList[index];
          log("uncompleted $task");
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetail(
                    index: task,
                    title: task.title,
                    description: task.description,
                  ),
                ),
              ).then((value) => setState(() {}));
            },
            child: Dismissible(
              background: buildSwipeActionLeft(),
              secondaryBackground: buildSwipeActionRight(),
              key: UniqueKey(),
              onDismissed: (direction) {
                switch (direction) {
                  case DismissDirection.endToStart:
                    context.read<TodoBloc>().add(DeleteTask(task: task));
                    break;
                  case DismissDirection.startToEnd:
                    _completeTask(context, task);
                    break;
                }
              },
              child: ListTile(
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
                    if (task.isDeleted == false) {
                      context.read<TodoBloc>().add(DeleteTask(task: task));
                    }
                  },
                  icon: const Icon(Icons.delete_outline_outlined),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildSwipeActionLeft() => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.green,
      );

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
      );
}
