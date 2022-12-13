import 'package:equatable/equatable.dart';

class UserInfoModel extends Equatable {
  final String userName;
  final String name;
  final String userPhotoUrl;
  final int followers;
  final int following;
  final String followersUrl;
  final String followingUrl;
  final int publicRepos;
  final String reposUrl;

  const UserInfoModel(
      {required this.name,
      required this.userName,
      required this.reposUrl,
      required this.userPhotoUrl,
      required this.followers,
      required this.following,
      required this.followersUrl,
      required this.followingUrl,
      required this.publicRepos});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      name: json['name'] ?? '',
      userName: json['login'],
      userPhotoUrl: json['avatar_url'],
      followers: json['followers'],
      following: json['following'],
      followersUrl: json['followers_url'],
      followingUrl:
          (json['following_url'] as String).replaceAll('{/other_user}', ''),
      publicRepos: json['public_repos'],
      reposUrl: json['repos_url'],
    );
  }
  @override
  List<Object?> get props => [
        reposUrl,
        name,
        userName,
        userPhotoUrl,
        followers,
        following,
        followersUrl,
        followingUrl,
        publicRepos,
      ];
}
