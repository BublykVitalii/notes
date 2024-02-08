import 'package:comitons_test/app/my_app.dart';
import 'package:comitons_test/domain/objectbox_service.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final objectBoxService = ObjectBoxService();
  await objectBoxService.init();

   runApp(MyApp(objectBoxService: objectBoxService));
}
