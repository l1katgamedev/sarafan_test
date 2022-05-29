import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarafan_test/bloc/todo_bloc.dart';
import 'package:sarafan_test/models/todo.dart';
import 'package:sarafan_test/service/guid_gen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 0,
          ),
          TextField(
            minLines: 1,
            maxLines: 5,
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Напр., Сходить в кино с друзьями завтра в 19:00',
              border: InputBorder.none,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            minLines: 1,
            maxLines: 5,
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: 'Описание',
              border: InputBorder.none,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  var newTask = ToDo(
                    title: titleController.text,
                    description: descriptionController.text,
                    id: GUIDGen.generate(),
                  );
                  context.read<TodoBloc>().add(AddTask(task: newTask));
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
