import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/todo_bloc.dart';

class TaskDetail extends StatefulWidget {
  final dynamic index;
  final dynamic title;
  final dynamic description;

  TaskDetail({Key? key, required this.index, this.title, this.description})
      : super(key: key);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  void initState() {
    widget.titleController.text = widget.title;
    widget.descriptionController.text = widget.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: TextField(
                        minLines: 1,
                        maxLines: 3,
                        controller: widget.titleController,
                        decoration: const InputDecoration(
                          hintText:
                              'Напр., Сходить в кино с друзьями завтра в 19:00',
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black38,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: TextField(
                        minLines: 1,
                        maxLines: 100,
                        controller: widget.descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Описание',
                          border: InputBorder.none,
                        ),
                        style:const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
