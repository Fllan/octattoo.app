import 'package:octattoo_flutter/core/base/base_repository.dart';
import 'package:octattoo_flutter/src/features/projects/data/repositories/projects_repository.dart';
import 'package:octattoo_flutter/src/features/projects/domain/models/project.dart';

/// Mock implementation of ProjectsRepository.
class MockProjectsRepository extends BaseRepository
    implements ProjectsRepository {
  final List<Project> _projects = [
    const Project(
      id: 'proj-1',
      title: 'Dragon Back Piece',
      customerId: 'cust-1',
      customerName: 'John Doe',
      description: 'Full back dragon tattoo with Japanese style',
      status: ProjectStatus.inProgress,
    ),
    const Project(
      id: 'proj-2',
      title: 'Rose Sleeve',
      customerId: 'cust-2',
      customerName: 'Jane Smith',
      description: 'Half sleeve with roses and thorns',
      status: ProjectStatus.planning,
    ),
  ];

  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 500));

  @override
  Future<List<Project>> getProjects() async {
    return executeWithLogging(() async {
      await _delay();
      return List.unmodifiable(_projects);
    }, 'getProjects');
  }

  @override
  Future<Project?> getProjectById(String id) async {
    return executeWithLogging(() async {
      await _delay();
      return _projects.where((p) => p.id == id).firstOrNull;
    }, 'getProjectById($id)');
  }

  @override
  Future<Project> createProject(Project project) async {
    return executeWithLogging(() async {
      await _delay();
      final newProject = project.copyWith(
        id: 'proj-${DateTime.now().millisecondsSinceEpoch}',
      );
      _projects.add(newProject);
      return newProject;
    }, 'createProject');
  }

  @override
  Future<Project> updateProject(Project project) async {
    return executeWithLogging(() async {
      await _delay();
      final index = _projects.indexWhere((p) => p.id == project.id);
      if (index == -1) {
        throw Exception('Project not found: ${project.id}');
      }
      _projects[index] = project;
      return project;
    }, 'updateProject(${project.id})');
  }

  @override
  Future<void> deleteProject(String id) async {
    return executeWithLogging(() async {
      await _delay();
      _projects.removeWhere((p) => p.id == id);
    }, 'deleteProject($id)');
  }
}
