part of 'home_bloc.dart';

enum EditTodoStatus { initial, loading, success, failure }

extension EditTodoStatusX on EditTodoStatus {
  bool get isLoadingOrSuccess => [
        EditTodoStatus.loading,
        EditTodoStatus.success,
      ].contains(this);
}

final class HomeState extends Equatable {
  final EditTodoStatus status;
  final String title;
  final String description;
  final List<Note>? noteList;
  final int id;
  final Note? selectedNote;

  const HomeState({
    this.status = EditTodoStatus.initial,
    this.title = '',
    this.description = '',
    this.noteList,
    this.selectedNote,
    required this.id,
  });

  HomeState copyWith({
    EditTodoStatus? status,
    Note? initialTodo,
    String? title,
    String? description,
    List<Note>? noteList,
    int? id,
  }) {
    return HomeState(
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
      noteList: noteList ?? this.noteList,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        status,
        title,
        description,
        noteList,
        selectedNote,
      ];
}
