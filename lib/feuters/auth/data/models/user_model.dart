class UserModel {
  final String userId;
  final String username;
  final String email;
  final bool isAdmin;
  final bool status;
  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.status,
    this.isAdmin = false,
  });
  factory UserModel.fromJson(credential, {bool isAdmin = false}) {
    return UserModel(
      userId: credential.id,
      username: credential.username,
      email: credential.user!.email,
      isAdmin: isAdmin,
      status: true,
    );
  }
}
