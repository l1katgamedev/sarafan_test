import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sarafan_test/models/todo.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<CompleteTask>(_onCompleteTask);
    on<ChaneTask>(_onChangeTask);
  }

  void _onAddTask(AddTask event, Emitter<TodoState> emit) {
    final state = this.state;
    emit(TodoState(
      allTasks: List.from(state.allTasks)..add(event.task),
      completedTasks: state.completedTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TodoState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);

    List<ToDo> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TodoState(allTasks: allTasks, completedTasks: state.completedTasks));
  }

  void _onChangeTask(ChaneTask event, Emitter<TodoState> emit) {
    final state = this.state;

    emit(TodoState(
      allTasks: List.from(state.allTasks),
      completedTasks: state.completedTasks,
    ));
  }

  void _onCompleteTask(CompleteTask event, Emitter<TodoState> emit) {
    final state = this.state;

    emit(
      TodoState(
          allTasks: List.from(state.allTasks)..remove(event.task),
          completedTasks: List.from(state.completedTasks)
            ..add(
              event.task.copyWith(isDone: true),
            )),
    );
  }

  void _onDeleteTask(DeleteTask event, Emitter<TodoState> emit) {
    final state = this.state;
    emit(
      TodoState(
        allTasks: List.from(state.allTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
      ),
    );
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toMap();
  }
}
