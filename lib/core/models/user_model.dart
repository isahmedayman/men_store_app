class UserModel {
  final String? accessToken;
  final String? refreshToken;

  const UserModel({this.accessToken, this.refreshToken});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );
  }
}
