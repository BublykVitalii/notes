import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  @Id()
  int id;

  final String description;
  final String title;

  Note({
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Note &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          id == other.id;

  @override
  String toString() {
    return 'Todo {title: $title, note: $description, id: $id ,';
  }

  Note copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
