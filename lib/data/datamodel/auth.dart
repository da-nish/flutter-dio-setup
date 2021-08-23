class AuthDTO {
  String token;
  int expiresIn;
  final String? tfaSid;
  final bool isTfaEnabled;
  final String mobile;
  final String firstName;
  final String lastName;
  final double balance;
  final bool isVerified;
  String refreshToken;

  AuthDTO.fromJson(Map<String, dynamic> jsonMap)
      : token = jsonMap['token'],
        expiresIn = jsonMap['expiresIn'],
        tfaSid = jsonMap['tfaSid'],
        isTfaEnabled = jsonMap['isTfaEnabled'],
        mobile = jsonMap['mobile'],
        firstName = jsonMap['firstName'],
        lastName = jsonMap['lastName'],
        balance = (jsonMap["balance"] is int)
            ? jsonMap["balance"].toDouble()
            : jsonMap["balance"],
        isVerified = jsonMap['isVerified'],
        refreshToken = jsonMap['refreshToken'];
}
