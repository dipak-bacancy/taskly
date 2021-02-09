import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:taskly/model/authentication.dart';
import 'package:taskly/src/repository.dart';

import 'bloc/projectlist_bloc.dart';
import 'components/header.dart';

import 'model/project.dart';

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

                  Navigator.pushNamed(context, '/create');
                },
                // mini: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: Icon(Icons.add),
              ),
            ),
            SizedBox(height: 30),
            // Body

            Expanded(
              child: BlocProvider(
                create: (context) =>
                    ProjectlistBloc(projectRepository: ProjectRepository()),
                child: ProjectListing(),
              ),
            ),
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

class ProjectListing extends StatefulWidget {
  @override
  _ProjectListingState createState() => _ProjectListingState();
}

class _ProjectListingState extends State<ProjectListing> {
  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  void _loadProjects() {
    context.bloc<ProjectlistBloc>().add(FetchProjects());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectlistBloc, ProjectlistState>(
      builder: (context, state) {
        if (state is ProjectlistLoaded) {
          return ProjectList(projects: state.projects);
        }
        if (state is ProjectlistError) {
          return Center(child: Text('error'));
        }

        return Center(child: CircularProgressIndicator());
      },
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
