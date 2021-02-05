import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taskly/model/authentication.dart';

import 'components/header.dart';

import 'model/project.dart';

Future<List<Project>> fetchProjects(http.Client client) async {
  String token = "0d3d9c3c9a4599d3cef1b52404bfd276763cf602";
  final response = await client.get(
    'https://api.todoist.com/rest/v1/projects',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
  // print(response);
  // print(response.body);

  // Use the compute function to run parseProjects in a separate isolate.
  return compute(parseProjects, response.body);
}

// A function that converts a response body into a List<Project>.
List<Project> parseProjects(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Project>((json) => Project.fromJson(json)).toList();
}

class Homepage extends StatelessWidget {
  // const Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header
            Header(
              backNav: false,
              title: 'Projects',
              minifab: FloatingActionButton(
                heroTag: "gotoCreateProject",
                onPressed: () {
                  // Respond to button press
                  // AuthenticationProvider().signOut();
                  // Navigator.pushNamed(context, '/login');

                  Navigator.pushNamed(context, '/create');
                },
                // mini: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: Icon(Icons.add),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Body

            Expanded(
                child: FutureBuilder<List<Project>>(
                    future: fetchProjects(http.Client()),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? ProjectList(projects: snapshot.data)
                          : Center(child: CircularProgressIndicator());
                    })),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "signout",
          backgroundColor: Colors.red,
          onPressed: () {
            // Respond to button press
            AuthenticationProvider().signOut().then((_) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
            });
          },
          // mini: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          child: Icon(Icons.logout),
        ),
      ),
    );
  }
}

class ProjectList extends StatelessWidget {
  final List<Project> projects;

  ProjectList({Key key, this.projects}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 40),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectThumbnail(project: projects[index]);
      },
    );
  }
}

class ProjectThumbnail extends StatelessWidget {
  final Project project;
  ProjectThumbnail({this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/project');
          },
          child: Container(
            height: 80,
            width: 80,
            // color: Colors.grey[200],
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[500]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.favorite,
                      color:
                          project.favorite == true ? Colors.red : Colors.white),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    project.name[0],
                    style: TextStyle(fontSize: 25),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(project.name),
        )
      ],
    );
  }
}
