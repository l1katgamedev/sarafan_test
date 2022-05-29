part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<ToDo> allTasks;
  final List<ToDo> completedTasks;

  const TodoState({
    this.allTasks = const <ToDo>[],
    this.completedTasks = const<ToDo>[],
  });

  @override
  List<Object> get props => [allTasks, completedTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks.map((e) => e.toMap()).toList(),
      'completedTasks': completedTasks.map((e) => e.toMap()).toList(),
    };
  }

  factory TodoState.fromMap(Map<String, dynamic> map) {
    return TodoState(
      allTasks: List<ToDo>.from(
        map['allTasks']?.map((e) => ToDo.fromMap(e)),
      ),
      completedTasks: List<ToDo>.from(
        map['completedTasks']?.map((e) => ToDo.fromMap(e)),
      ),
    );
  }
}
