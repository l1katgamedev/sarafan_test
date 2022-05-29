part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TodoEvent {
  final ToDo task;

  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TodoEvent {
  final ToDo task;

  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class CompleteTask extends TodoEvent {
  final ToDo task;

  const CompleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class ChaneTask extends TodoEvent {
  final ToDo task;

  const ChaneTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TodoEvent {
  final ToDo task;

  const DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}
