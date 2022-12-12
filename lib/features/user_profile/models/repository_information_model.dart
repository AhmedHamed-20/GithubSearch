import 'package:equatable/equatable.dart';

class RepositoryInformationModel extends Equatable {
  final String language;
  final String repoName;
  final String repoUrl;
  final String repoLanguagesUrl;
  final String createdAt;
  final String updatedAt;
  final String contributorsUrl;

  const RepositoryInformationModel(
      this.language,
      this.repoName,
      this.repoUrl,
      this.repoLanguagesUrl,
      this.createdAt,
      this.updatedAt,
      this.contributorsUrl);

  factory RepositoryInformationModel.fromJson(Map<String, dynamic> json) {
    return RepositoryInformationModel(
      json['language'] ?? '',
      json['name'],
      json['html_url'],
      json['languages_url'],
      json['created_at'],
      json['updated_at'],
      json['contributors_url'],
    );
  }

  @override
  List<Object?> get props => [
        language,
        repoName,
        repoUrl,
        repoLanguagesUrl,
        createdAt,
        updatedAt,
        contributorsUrl,
      ];
}
