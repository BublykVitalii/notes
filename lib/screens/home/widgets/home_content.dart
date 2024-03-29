import 'package:auto_route/auto_route.dart';
import 'package:comitons_test/domain/note_model.dart';
import 'package:comitons_test/router/app_router.gr.dart';
import 'package:comitons_test/screens/home/bloc/home_bloc.dart';
import 'package:comitons_test/screens/home/widgets/add_note_button.dart';
import 'package:comitons_test/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'note_list_tile.dart';
import 'note_search.dart';

class HomePageContent extends StatefulWidget {
  final Note? initialNote;

  const HomePageContent({super.key, this.initialNote});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  ValueNotifier<bool> searchActive = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: StyleguideColors.complimentaryHoverPurple,
            foregroundColor: StyleguideColors.white,
            title: const Text('Нотатник'),
            elevation: 0,
            actions: [
              ValueListenableBuilder<bool>(
                valueListenable: searchActive,
                builder: (context, isSearchActive, _) {
                  return IconButton(
                    icon: Icon(isSearchActive ? Icons.close : Icons.search),
                    onPressed: () {
                      searchActive.value = !searchActive.value;
                    },
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: state.status == EditTodoStatus.loading
                ? const CircularProgressIndicator()
                : state.status == EditTodoStatus.failure
                    ? _buildErrorMessage(context)
                    : _buildNoteList(
                        context,
                        state.noteList ?? [],
                      ),
          ),
        );
      },
    );
  }

  Widget _buildNoteList(
    BuildContext context,
    List<Note> noteList,
  ) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    return ValueListenableBuilder<bool>(
      valueListenable: searchActive,
      builder: (context, isSearchActive, _) {
        return Column(
          children: [
            if (isSearchActive)
              NoteSearchWidget(
                notes: noteList,
                bloc: bloc,
              ),
            Expanded(
              child: ListView.builder(
                itemCount: noteList.length,
                itemBuilder: (BuildContext context, int index) {
                  Note note = noteList[index];
                  return NoteListTile(bloc: bloc, note: note);
                },
              ),
            ),
            AddNoteButton(
              onPressed: () => context.router.push(
                CreateNoteRoute(bloc: bloc),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildErrorMessage(BuildContext context) {
    return const Center(
      child: Text(
        'Помилка при завантаженні записок',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
