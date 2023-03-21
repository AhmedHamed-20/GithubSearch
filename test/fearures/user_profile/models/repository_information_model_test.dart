import 'package:flutter_test/flutter_test.dart';
import 'package:gethubsearch/features/user_profile/models/repository_information_model.dart';

import '../repository/remote_user_profile_dumy_data.dart';

void main() {
  group('test repository information model', () {
    test(
        'repository information from json should return repository information model',
        () {
      final repositoryInformationModel =
          RepositoryInformationModel.fromJson(tRepositoryInformationMap);
      expect(repositoryInformationModel, isA<RepositoryInformationModel>());
      expect(repositoryInformationModel.repoName, isA<String>());
      expect(repositoryInformationModel.contributorsUrl, isA<String>());
      expect(repositoryInformationModel.createdAt, isA<String>());
      expect(repositoryInformationModel.language, isA<String>());
      expect(repositoryInformationModel.language, isA<String>());
      expect(repositoryInformationModel.repoLanguagesUrl, isA<String>());
      expect(repositoryInformationModel.repoUrl, isA<String>());
      expect(repositoryInformationModel.updatedAt, isA<String>());
    });
  });
}
