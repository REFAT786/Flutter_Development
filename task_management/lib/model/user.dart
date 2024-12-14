class User {
  final String firstName;
  final String lastName;
  String email;
  final String password;
  final String? address;
  String? imageUrl; // Profile image URL

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.address,
    this.imageUrl,
  });

  // Factory method to create User model from JSON response
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['data']['firstName'] ?? '',
      lastName: json['data']['lastName'] ?? '',
      email: json['data']['email'] ?? '',
      password: json['data']['password'] ?? '',
      address: json['data']['address'] ?? '',
      imageUrl: json['data']['imageUrl'] ?? '',
    );
  }
}
