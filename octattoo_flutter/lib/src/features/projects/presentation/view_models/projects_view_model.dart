import 'package:octattoo_flutter/core/base/base_view_model.dart';
import 'package:octattoo_flutter/src/features/projects/data/repositories/projects_repository.dart';
import 'package:octattoo_flutter/src/features/projects/domain/models/project.dart';

/// ViewModel for the projects list screen.
class ProjectsViewModel extends BaseViewModel {
  ProjectsViewModel(this._repository);

  final ProjectsRepository _repository;
  List<Project> _projects = [];

  List<Project> get projects => List.unmodifiable(_projects);

  Future<void> loadProjects() async {
    await executeAsync(() async {
      _projects = await _repository.getProjects();
    });
  }

  Future<void> refresh() => loadProjects();

  Future<void> deleteProject(String id) async {
    await executeAsync(() async {
      await _repository.deleteProject(id);
      await loadProjects();
    });
  }
}
