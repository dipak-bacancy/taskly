part of 'projectlist_bloc.dart';

@immutable
abstract class ProjectlistState {}

class ProjectlistInitial extends ProjectlistState {}

class ProjectlistLoading extends ProjectlistState {}

class ProjectlistLoaded extends ProjectlistState {
  final List<Project> projects;

  ProjectlistLoaded({this.projects});
}

class ProjectlistError extends ProjectlistState {
  final error;
  ProjectlistError({this.error});
}
