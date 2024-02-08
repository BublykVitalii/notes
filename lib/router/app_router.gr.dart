// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:comitons_test/domain/note_model.dart' as _i7;
import 'package:comitons_test/screens/home/bloc/home_bloc.dart' as _i6;
import 'package:comitons_test/screens/home/page/change_note_page.dart' as _i1;
import 'package:comitons_test/screens/home/page/create_note_page.dart' as _i2;
import 'package:comitons_test/screens/home/page/home_page.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ChangeNoteRoute.name: (routeData) {
      final args = routeData.argsAs<ChangeNoteRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ChangeNotePage(
          key: args.key,
          bloc: args.bloc,
          note: args.note,
        ),
      );
    },
    CreateNoteRoute.name: (routeData) {
      final args = routeData.argsAs<CreateNoteRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CreateNotePage(
          key: args.key,
          bloc: args.bloc,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChangeNotePage]
class ChangeNoteRoute extends _i4.PageRouteInfo<ChangeNoteRouteArgs> {
  ChangeNoteRoute({
    _i5.Key? key,
    required _i6.HomeBloc bloc,
    required _i7.Note note,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ChangeNoteRoute.name,
          args: ChangeNoteRouteArgs(
            key: key,
            bloc: bloc,
            note: note,
          ),
          initialChildren: children,
        );

  static const String name = 'ChangeNoteRoute';

  static const _i4.PageInfo<ChangeNoteRouteArgs> page =
      _i4.PageInfo<ChangeNoteRouteArgs>(name);
}

class ChangeNoteRouteArgs {
  const ChangeNoteRouteArgs({
    this.key,
    required this.bloc,
    required this.note,
  });

  final _i5.Key? key;

  final _i6.HomeBloc bloc;

  final _i7.Note note;

  @override
  String toString() {
    return 'ChangeNoteRouteArgs{key: $key, bloc: $bloc, note: $note}';
  }
}

/// generated route for
/// [_i2.CreateNotePage]
class CreateNoteRoute extends _i4.PageRouteInfo<CreateNoteRouteArgs> {
  CreateNoteRoute({
    _i5.Key? key,
    required _i6.HomeBloc bloc,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          CreateNoteRoute.name,
          args: CreateNoteRouteArgs(
            key: key,
            bloc: bloc,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateNoteRoute';

  static const _i4.PageInfo<CreateNoteRouteArgs> page =
      _i4.PageInfo<CreateNoteRouteArgs>(name);
}

class CreateNoteRouteArgs {
  const CreateNoteRouteArgs({
    this.key,
    required this.bloc,
  });

  final _i5.Key? key;

  final _i6.HomeBloc bloc;

  @override
  String toString() {
    return 'CreateNoteRouteArgs{key: $key, bloc: $bloc}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
