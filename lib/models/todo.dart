import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  dynamic id;
  dynamic title;
  dynamic description;
  dynamic isDone;
  bool? isDeleted;

  ToDo({
    this.id,
    this.title,
    this.description,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  ToDo copyWith({
    String? id,
    dynamic title,
    dynamic description,
    bool? isDone,
    bool? isDeleted,
  }) {
    return ToDo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory ToDo.fromMap(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        isDone,
        isDeleted,
      ];
}
