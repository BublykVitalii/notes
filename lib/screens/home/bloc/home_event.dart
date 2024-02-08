part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class EditTodoChangeEvent extends HomeEvent {
  final int id;
  final String title;
  final String description;

  const EditTodoChangeEvent({
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [id, title, description];
}

class CreateNoteEvent extends HomeEvent {
  final String title;
  final String description;

  const CreateNoteEvent({
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [title, description];
}

class DeleteNote extends HomeEvent {
  final int noteId;

  const DeleteNote(this.noteId);

  @override
  List<Object> get props => [noteId];
}

class LoadNotesEvent extends HomeEvent {}

class SelectNoteEvent extends HomeEvent {
  final int noteId;

  const SelectNoteEvent(this.noteId);

  @override
  List<Object> get props => [noteId];
}
