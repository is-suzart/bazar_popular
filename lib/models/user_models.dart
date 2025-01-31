class UserModels {
  final String id;
  final String name;
  final String email;
  final String? password;
  final String telephone;
  final String state;
  final String city;
  final String role;
  final String? profilePicture;
  final String? created;
  final String? updated;

  UserModels({required this.id, required this.name, required this.email, this.password, required this.telephone,
      required this.state, required this.city, required this.role, required this.profilePicture, required this.created,required this.updated});

  factory UserModels.fromJson(Map<String, dynamic> json) {
    return UserModels(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      telephone: json['telephone'],
      state: json['state'],
      city: json['city'],
      role: json['role'],
      profilePicture: json['profile_picture'],
      created: json['created_at'],
      updated: json['updated_at']
    );
  }

  factory UserModels.fromLocalJson(Map<String, dynamic> json) {
    return UserModels(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      telephone: json['telephone'],
      state: json['state'],
      city: json['city'],
      role: json['role'],
      profilePicture: json['profilePicture'],
      created: json['created'],
      updated: json['updated']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'telephone': telephone,
      'state': state,
      'city': city,
      'role': role,
    };
  }
}
