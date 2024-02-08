import 'package:auto_route/auto_route.dart';
import 'package:comitons_test/domain/note_model.dart';
import 'package:comitons_test/screens/home/bloc/home_bloc.dart';
import 'package:comitons_test/screens/home/widgets/my_app_bar.dart';
import 'package:comitons_test/screens/home/widgets/note_button_purple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ChangeNotePage extends StatefulWidget {
  final HomeBloc bloc;
  final Note note;

  const ChangeNotePage({Key? key, required this.bloc, required this.note})
      : super(key: key);

  @override
  State<ChangeNotePage> createState() => _ChangeNotePageState();
}

class _ChangeNotePageState extends State<ChangeNotePage> {
  late TextEditingController _editedTitleController;
  late TextEditingController _editedDescriptionController;

  @override
  void initState() {
    super.initState();
    widget.bloc.add(SelectNoteEvent(widget.note.id));
    _editedTitleController = TextEditingController(text: widget.note.title);
    _editedDescriptionController =
        TextEditingController(text: widget.note.description);
  }

  void _onSaveButtonPressed() {
    String newTitle = _editedTitleController.text;
    String newDescription = _editedDescriptionController.text;

    widget.bloc.add(EditTodoChangeEvent(
      id: widget.note.id,
      title: newTitle,
      description: newDescription,
    ));
  }

  @override
  void dispose() {
    _editedTitleController.dispose();
    _editedDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: MyAppBar(title: 'Оновити запис'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              TextFormField(
                controller: _editedTitleController,
                decoration: const InputDecoration(labelText: 'Заголовок'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _editedDescriptionController,
                maxLines: 5,
                decoration: const InputDecoration(labelText: 'Опис'),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NoteButtonPurple(
                    title: 'Оновити',
                    heroTag: 'button update',
                    onPressed: () => context.router.pop(),
                  ),
                  NoteButtonPurple(
                    title: 'Зберегти',
                    heroTag: 'button save',
                    onPressed: () {
                      _onSaveButtonPressed();
                      context.router.pop();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
