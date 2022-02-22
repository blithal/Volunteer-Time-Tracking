class User {
  final int userID;
  final String name;
  final String volunteerAdmin;
  final bool active;

  User(
      {required this.userID,
      required this.name,
      required this.volunteerAdmin,
      required this.active});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['UserID'],
      name: json['Name'],
      volunteerAdmin: json['VolunteerAdmin'],
      active: json['Active'],
    );
  }

  Map<String, dynamic> toJson() => {
        'UserID': userID,
        'Name': name,
        'VolunteerAdmin': volunteerAdmin,
        'Active': active,
      };
}
