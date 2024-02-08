
import 'package:auto_route/auto_route.dart';
import 'package:comitons_test/domain/note_model.dart';
import 'package:comitons_test/screens/home/bloc/home_bloc.dart';
import 'package:comitons_test/theme/colors.dart';
import 'package:flutter/material.dart';

class RemoveNoteButton extends StatelessWidget {
  final HomeBloc bloc;
  final Note note;

  const RemoveNoteButton({
    super.key,
    required this.bloc,
    required this.note,
  });



  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Видалити нотатку?'),
              content: const Text(
                  'Дія невідворотна. Ви впевнені?'),
              actions: [
                TextButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  child: const Text('Ні'),
                ),
                TextButton(
                  onPressed: () {
                    bloc.add(DeleteNote(note.id));
                    context.router.pop();
                  },
                  child: const Text('Так'),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.delete, color: StyleguideColors.complimentaryHoverPurple,),
    );
  }
}