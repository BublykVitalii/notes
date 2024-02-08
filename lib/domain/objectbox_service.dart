import 'package:path_provider/path_provider.dart';
import '../objectbox.g.dart';
import 'note_model.dart';
export 'package:objectbox/objectbox.dart';

class ObjectBoxService {
  late Store _store;
  late Box<Note> _noteBox;

  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    _store =
        Store(getObjectBoxModel(), directory: '${directory.path}/objectbox');
    _noteBox = Box<Note>(_store);
  }

  Future<void> saveNote(Note note) async {
    _noteBox.put(note);
  }

  Future<void> deleteNoteById(int id) async {
    _noteBox.remove(id);
  }

  Future<List<Note>> getAllNotes() async {
    return _noteBox.getAll();
  }

  Future changeNote(int id, String title, String description) async {
    final note = _noteBox.get(id);

    if (note != null) {
      final updatedNote = Note(
        id: id,
        title: title,
        description: description,
      );

      return _noteBox.put(updatedNote);
    }
  }

  Future<Note?> getNoteById(int id) async {
   return _noteBox.get(id);

  }
}