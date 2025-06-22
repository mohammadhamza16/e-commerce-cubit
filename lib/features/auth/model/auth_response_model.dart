class AuthResponseModel {
  final String? token;

  AuthResponseModel({required this.token});
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(token: json['token'] as String?);
  }
  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}
