class ProjectModel {
  final String appName;
  final String description;
  final String image;
  final List<String> tags;
  final String iosAppLink;
  final String androidAppLink;
  final String githubLink;
  final String projectStatus;

  ProjectModel({
    required this.appName,
    required this.description,
    required this.image,
    required this.tags,
    required this.iosAppLink,
    required this.androidAppLink,
    required this.githubLink,
    required this.projectStatus,
  });
}