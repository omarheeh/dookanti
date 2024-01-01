class UserModel {
  final String username;
  final String email;
  UserModel({
    required this.username,
    required this.email,
  });
  factory UserModel.fromJson(credential) {
    return UserModel(
      username: credential.username,
      email: credential.user!.email,
    );
  }
}
