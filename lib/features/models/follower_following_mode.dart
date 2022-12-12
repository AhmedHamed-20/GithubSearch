import 'package:equatable/equatable.dart';

class FollowersFollowingModel extends Equatable {
  final String userName;
  final String userPhotoUrl;
  final String htmlUrl;
  const FollowersFollowingModel({
    required this.userName,
    required this.htmlUrl,
    required this.userPhotoUrl,
  });

  factory FollowersFollowingModel.fromJson(Map<String, dynamic> json) {
    return FollowersFollowingModel(
      htmlUrl: json['html_url'],
      userName: json['login'],
      userPhotoUrl: json['avatar_url'],
    );
  }

  @override
  List<Object?> get props => [userName, userPhotoUrl, htmlUrl];
}
