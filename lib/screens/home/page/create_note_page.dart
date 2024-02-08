import 'package:auto_route/auto_route.dart';
import 'package:comitons_test/screens/home/bloc/home_bloc.dart';
import 'package:comitons_test/screens/home/widgets/my_app_bar.dart';
import 'package:comitons_test/theme/colors.dart';
import 'package:comitons_test/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _kSpace = 16.0;

@RoutePage()
class CreateNotePage extends StatefulWidget {
  final HomeBloc bloc;

  const CreateNotePage({super.key, required this.bloc});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  void _addTodo() {
    String title = _titleController.text;
    String note = _noteController.text;
    widget.bloc.add(CreateNoteEvent(title: title, description: note));
    context.router.pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: MyAppBar(title: 'Додати новий запис'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(_kSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Назва',
                  hintText: 'Введіть назву замітки',
                  hintStyle: context.bodyMedium
                      .textColor(StyleguideColors.charcoalGrey),
                ),
              ),
              const SizedBox(height: _kSpace),
              TextFormField(
                controller: _noteController,
                decoration: InputDecoration(
                  labelText: 'Текст нотатки',
                  hintText: 'Введіть текст замітки',
                  hintStyle: context.bodyMedium
                      .textColor(StyleguideColors.charcoalGrey),
                ),
                maxLines: null,
              ),
              const SizedBox(height: _kSpace),
              ElevatedButton(
                onPressed: () => _addTodo(),
                child: const Text('Додати'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
