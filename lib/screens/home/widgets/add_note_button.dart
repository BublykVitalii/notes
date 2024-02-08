
import 'package:auto_route/auto_route.dart';
import 'package:comitons_test/router/app_router.gr.dart';
import 'package:comitons_test/screens/home/bloc/home_bloc.dart';
import 'package:comitons_test/theme/colors.dart';
import 'package:flutter/material.dart';

class AddNoteButton extends StatelessWidget {
  final HomeBloc bloc;

  const AddNoteButton({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: 50,
        width: 100,
        child: FloatingActionButton(
          backgroundColor: StyleguideColors.primaryPurple,
          onPressed: () => context.router.push(CreateNoteRoute(bloc: bloc)),
          child: const Text(
            'Додати',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
