import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/user.dart';

class AuthService {
  static const String baseUrl = 'http://206.189.138.45:7152';

  Future<User> registerUser(String firstName, String lastName, String email, String password) async {

    var uri = Uri.parse('$baseUrl/user/register');

    var request = http.MultipartRequest('POST', uri)
      ..fields['firstName'] = firstName
      ..fields['lastName'] = lastName
      ..fields['email'] = email
      ..fields['password'] = password;

    // Send the request
    var response = await request.send();

    // Get the response body
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(responseBody));
    } else {
      var errorResponse = json.decode(responseBody);
      throw Exception(errorResponse['message'] ?? 'Registration failed');
    }
  }

  // User login
  Future<String> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['data']['token']; // Return the token
    } else {
      var errorResponse = json.decode(response.body);
      throw Exception(errorResponse['message'] ?? 'Failed to login');
    }
  }

  // Update user profile
  Future<String> updateProfile(String token, String firstName, String lastName, String password, String address) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/user/update-profile'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
        'address': address,
      }),
    );

    // Print the response status and body for debugging
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['message'] ?? 'Profile updated successfully';
    } else {
      var errorResponse = json.decode(response.body);
      throw Exception(errorResponse['message'] ?? 'Failed to update profile');
    }
  }

  // Fetch user profile (requires authentication token)
  Future<User> getUserProfile(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/my-profile'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      var errorResponse = json.decode(response.body);
      throw Exception(errorResponse['message'] ?? 'Failed to load user profile');
    }
  }


 /* // Upload a file (image or document)
  Future<String> uploadFile(String token, File file) async {
    final Uri uri = Uri.parse('http://206.189.138.45:7152/user/update-profile');

    // Create a MultipartRequest
    var request = http.MultipartRequest('PATCH', uri);

    // Add the Authorization header
    request.headers['Authorization'] = 'Bearer $token';

    // Attach the file with the correct field name
    var multipartFile = await http.MultipartFile.fromPath('file', file.path);
    request.files.add(multipartFile);

    print("Token: $token");
    print("Uri: $uri");
    print("Path: $multipartFile");
    print('File Path: ${file.path}');
    print('Headers: ${request.headers}');
    print('Fields: ${request.fields}');
    print('Files: ${request.files}');

    // Send the request
    var response = await request.send();

    print("Status code : ${response.statusCode}");
    // Read the response body
    var responseBody = await response.stream.bytesToString();

    //print('Response Body: $responseBody');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      return jsonResponse['data']['imageUrl'] ?? 'File uploaded successfully';
    } else {
      throw Exception('Failed to upload file: ${response.reasonPhrase}');
    }
  }*/

}
