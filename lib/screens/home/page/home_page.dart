import 'package:auto_route/auto_route.dart';
import 'package:comitons_test/domain/objectbox_service.dart';
import 'package:comitons_test/screens/home/bloc/home_bloc.dart';
import 'package:comitons_test/screens/home/widgets/home_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
          initialNote: null, objectBoxService: context.read<ObjectBoxService>())
        ..add(LoadNotesEvent()),
      child: const Scaffold(
        body: HomePageContent(),
      ),
    );
  }
}
