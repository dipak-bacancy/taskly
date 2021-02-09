import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskly/model/project.dart';
import 'package:taskly/src/repository.dart';

part 'projectlist_event.dart';
part 'projectlist_state.dart';

class ProjectlistBloc extends Bloc<ProjectlistEvent, ProjectlistState> {
  final ProjectRepository projectRepository;

  ProjectlistBloc({this.projectRepository}) : super(ProjectlistInitial());

  @override
  Stream<ProjectlistState> mapEventToState(
    ProjectlistEvent event,
  ) async* {
    yield ProjectlistLoading();

    List<Project> projects;

    try {
      if (event is FetchProjects) {
        projects = await projectRepository.fetchProjects();

        yield ProjectlistLoaded(projects: projects);
      }
    } catch (e) {
      yield ProjectlistError(error: e);
    }
    // TODO: implement mapEventToState
  }
}
