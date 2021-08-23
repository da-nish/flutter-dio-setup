class UserDetails {
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;
  final String country;
  final String town;
  final String address;
  final String postalCode;
  final String dateOfBirth;
  final bool phoneNotifications;
  final bool smsNotifications;
  final bool postNotifications;
  final bool emailNotifications;
  final bool twoFactorEnabled;

  UserDetails.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        firstName = json["firstName"],
        lastName = json["lastName"],
        mobile = json["mobile"],
        country = json["country"],
        town = json["town"],
        address = json["address"],
        postalCode = json["postalCode"],
        dateOfBirth = json["dateOfBirth"],
        phoneNotifications = json["phoneNotifications"],
        smsNotifications = json["smsNotifications"],
        postNotifications = json["postNotifications"],
        emailNotifications = json["emailNotifications"],
        twoFactorEnabled = json["twoFactorEnabled"];
}
