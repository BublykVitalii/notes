import 'package:auto_route/auto_route.dart';
import 'package:comitons_test/domain/note_model.dart';
import 'package:comitons_test/router/app_router.gr.dart';
import 'package:comitons_test/screens/home/bloc/home_bloc.dart';
import 'package:comitons_test/screens/home/widgets/remove_note_button.dart';
import 'package:flutter/material.dart';

class NoteListTile extends StatelessWidget {
  const NoteListTile({
    super.key,
    required this.bloc,
    required this.note,
  });

  final HomeBloc bloc;
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          context.router.push(
            ChangeNoteRoute(bloc: bloc, note: note),
          );
        },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RemoveNoteButton(bloc: bloc, note: note),
          ],
        ),
        title: Text(
          note.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text(
          note.description,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
