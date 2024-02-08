import 'package:comitons_test/domain/note_model.dart';
import 'package:comitons_test/screens/home/bloc/home_bloc.dart';
import 'package:comitons_test/screens/home/widgets/note_list_tile_search.dart';
import 'package:comitons_test/theme/colors.dart';
import 'package:flutter/material.dart';
class NoteSearchWidget extends StatefulWidget {
  final List<Note> notes;
  final HomeBloc bloc;

  const NoteSearchWidget({
    Key? key,
    required this.notes,
    required this.bloc,
  }) : super(key: key);

  @override
  State<NoteSearchWidget> createState() => _NoteSearchWidgetState();
}

class _NoteSearchWidgetState extends State<NoteSearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchActive = false;
  List<Note> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isSearchActive ? 300 : 100,
      curve: Curves.easeInOut,
      child: Column(
        children: [
          TextField(
            autofocus: false,
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Пошук',
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: StyleguideColors.complimentaryHoverPurple,
                ),
                onPressed: () {
                  setState(() {
                    _searchController.clear();
                    _searchResult.clear();
                    _isSearchActive = false;
                  });
                },
              ),
            ),
            onChanged: (value) {
              setState(() {
                _isSearchActive = value.isNotEmpty;
                _searchResult = widget.notes
                    .where((note) =>
                        note.title
                            .toLowerCase()
                            .contains(value.toLowerCase()) ||
                        note.description
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                    .toList();
              });
            },
            onTap: () {
              setState(() {
                _isSearchActive = true;
              });
            },
            onEditingComplete: () {
              setState(() {
                _isSearchActive = false;
              });
            },
          ),
          Expanded(
            child: _isSearchActive
                ? ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, index) {
                      if (index < _searchResult.length) {
                        final note = _searchResult[index];
                        return NoteListTileSearch(
                          widget: widget,
                          note: note,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
