import 'package:taskly/model/project.dart';
import 'package:taskly/src/ProjectProvider.dart';

class ProjectRepository {
  ProjectApiProvider _projectApiProvider = ProjectApiProvider();

  Future<List<Project>> fetchProjects() => _projectApiProvider.fetchProjects();
}
