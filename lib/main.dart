import 'package:flutter/material.dart';

import 'package:taskly/splash.dart';

import 'package:taskly/tasks.dart';

import 'CreateProject.dart';
import 'Homepage.dart';
import 'Project.dart';
import 'TaskDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'taskly',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => Splash(),
        // '/': (context) => Splash(),
        '/': (context) => Homepage(),

        '/create': (context) => CreateProject(),
        '/project': (context) => Project(),
        '/task-completed': (context) => TaskDetail(),
        '/task': (context) => Task(),
      },
    );
  }
}
