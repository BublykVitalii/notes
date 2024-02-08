import 'package:comitons_test/domain/note_model.dart';
import 'package:comitons_test/domain/objectbox_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required Note? initialNote,
    required ObjectBoxService objectBoxService,
  })  : _objectBoxService = objectBoxService,
        super(
          HomeState(
            id: initialNote?.id ?? 0,
            initialNote: initialNote,
            title: initialNote?.title ?? '',
            description: initialNote?.description ?? '',
          ),
        ) {
    on<EditTodoChangeEvent>(_onNoteChanged);
    on<CreateNoteEvent>(_onCreateNote);
    on<DeleteNote>(_onDeleteNote);
    on<LoadNotesEvent>(_onLoadNotes);
    on<SelectNoteEvent>(_onSelectNote);
  }

  final ObjectBoxService _objectBoxService;

  Future<void> _onNoteChanged(EditTodoChangeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(status: EditTodoStatus.loading));
      await _objectBoxService.changeNote(event.id, event.title, event.description);
      final List<Note> listNote = state.noteList ?? [];
      final int index = listNote.indexWhere((element) => element.id == event.id);

      listNote[index] = Note(
        id: event.id,
        title: event.title,
        description: event.description,
      );

      emit(state.copyWith(
        id: event.id,
        title: event.title,
        description: event.description,
        status: EditTodoStatus.success,
      ));

    } catch (e) {
      emit(state.copyWith(status: EditTodoStatus.failure));
    }
  }

  Future<void> _onCreateNote(
      CreateNoteEvent event, Emitter<HomeState> emit) async {
    final List<Note> listNote = state.noteList ?? [];
    emit(state.copyWith(status: EditTodoStatus.loading));

    final newNote = Note(
      id: 0,
      title: event.title,
      description: event.description,
    );

    try {
      await _objectBoxService.saveNote(newNote);
      listNote.add(newNote);
      emit(state.copyWith(
        status: EditTodoStatus.success,
        noteList: listNote,
      ));
    } catch (e) {
      emit(state.copyWith(status: EditTodoStatus.failure));
    }
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: EditTodoStatus.loading));

    try {
      await _objectBoxService.deleteNoteById(event.noteId);
      emit(state.copyWith(status: EditTodoStatus.loading));
      final notes = await _objectBoxService.getAllNotes();
      emit(state.copyWith(status: EditTodoStatus.success, noteList: notes));
    } catch (e) {
      emit(state.copyWith(status: EditTodoStatus.failure));
    }
  }

  Future<void> _onLoadNotes(
      LoadNotesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: EditTodoStatus.loading));

    try {
      final notes = await _objectBoxService.getAllNotes();
      emit(state.copyWith(status: EditTodoStatus.success, noteList: notes));
    } catch (e) {
      emit(state.copyWith(status: EditTodoStatus.failure));
    }
  }

  Future<void> _onSelectNote(SelectNoteEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: EditTodoStatus.loading));

    try {
      final selectedNote = await _objectBoxService.getNoteById(event.noteId);
      if (selectedNote != null) {
        emit(state.copyWith(
          id: selectedNote.id,
          title: selectedNote.title,
          description: selectedNote.description,
          status: EditTodoStatus.success,
        ));
      } else {
        emit(state.copyWith(status: EditTodoStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: EditTodoStatus.failure));
    }
  }
}

