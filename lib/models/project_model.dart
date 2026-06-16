class ProjectModel {
  final String image;
  final String title;
  final String projectId;
  final bool highlighted;

  ProjectModel({
    required this.image,
    required this.title,
    required this.projectId,
    this.highlighted = false,
  });
}