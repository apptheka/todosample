import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:todolist/app/app.dart';
import 'package:todolist/app/constant.dart';
import 'package:todolist/app/dl.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await pathProvider.getApplicationDocumentsDirectory();

  Hive.init(directory.path);
  await Hive.openBox(HiveConstant.ADD_BOX);
  await initAppModule();
  await initHomeModule();
  
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(MyApp()));
  // runApp(MyAdpp());
}
