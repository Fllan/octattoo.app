import 'package:octattoo_flutter/src/features/projects/domain/models/project.dart';

/// Repository interface for managing projects.
abstract class ProjectsRepository {
  Future<List<Project>> getProjects();
  Future<Project?> getProjectById(String id);
  Future<Project> createProject(Project project);
  Future<Project> updateProject(Project project);
  Future<void> deleteProject(String id);
}
