import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/auth_service.dart';
import '../model/user.dart';
import 'login_screen.dart';
import 'profile_edit_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String? token;

  ProfileScreen({this.token, Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService authService = AuthService();
  final ImagePicker _picker = ImagePicker();
  File? _selectedFile;
  bool isLoading = false;
  User? user;

  @override
  void initState() {
    super.initState();
    _fetchProfile(); // Fetch profile data on screen load
  }

  // Fetch user profile
  Future<void> _fetchProfile() async {
    if (widget.token == null || widget.token!.isEmpty) {
      _redirectToLogin("Token is missing. Please log in again.");
      return;
    }

    try {
      user = await authService.getUserProfile(widget.token!);
      setState(() {});
    } catch (e) {
      _showSnackbar("Error", "Failed to fetch profile: $e");
    }
  }

  // Show snackbar message
  void _showSnackbar(String title, String message) {
    Get.snackbar(title, message, snackPosition: SnackPosition.TOP);
  }

  // Redirect to login screen
  void _redirectToLogin(String message) {
    _showSnackbar("Error", message);
    Get.offAll(() => LoginScreen());
  }

  // Navigate to ProfileEditScreen
  void _editProfile() async {
    var updatedUser = await Get.to(() => ProfileEditScreen(
          token: widget.token,
          user: user,
        ));

    if (updatedUser != null) {
      setState(() {
        user = updatedUser; // Update the user data with the new one
      });
    }
  }

  // Logout function
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Clear the token
    Get.offAll(() => LoginScreen()); // Redirect to LoginScreen
  }

  // Pick a file using ImagePicker
  Future<void> _pickFile() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
      });
    }
  }

  // Upload the selected file
  /*Future<void> _uploadFile() async {
    if (_selectedFile == null) {
      Get.snackbar('Error', 'Please select a file first',
          snackPosition: SnackPosition.TOP);
      return;
    }

    setState(() => isLoading = true);

    try {
      final imageUrl =
          await authService.uploadFile(widget.token!, _selectedFile!);
      Get.snackbar('Success', 'File uploaded: $imageUrl',
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload file: $e',
          snackPosition: SnackPosition.TOP);
    } finally {
      setState(() => isLoading = false);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("Profile", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: _editProfile, // Edit profile on click
            icon: Icon(Icons.edit, color: Colors.black),
          ),
          IconButton(
            onPressed: _logout, // Logout on click
            icon: Icon(Icons.logout, color: Colors.black),
          ),
        ],
      ),
      body: user != null
          ? Padding(
              padding: const EdgeInsets.only(top: 16,right: 15,left: 15),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 3,right: 3,bottom: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Stack(
                        children: [
                          _selectedFile != null
                              ? ClipOval(
                                child: Image.file(
                                    _selectedFile!,
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                              )
                              : Icon(
                                  Icons.account_circle,
                                  size: 120,
                                ),
                          Positioned(
                            bottom: -13,
                            right: -10,
                            child: IconButton(
                              icon: Icon(Icons.camera_alt),
                              onPressed: _pickFile,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    /*ElevatedButton(
                      onPressed: _uploadFile,
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Upload File'),
                    ),*/
                    const SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(color: Colors.blue, blurRadius: 1),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.teal,
                            ),
                            title: Text(
                              'Name: ${user!.firstName} ${user!.lastName}',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          SizedBox(height: 5),
                          Divider(color: Colors.blueAccent, thickness: 0.3),
                          SizedBox(height: 5),
                          ListTile(
                            leading: Icon(
                              Icons.email_outlined,
                              color: Colors.redAccent,
                            ),
                            title: Text(
                              'Email: ${user!.email}',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          SizedBox(height: 5),
                          Divider(color: Colors.blueAccent, thickness: 0.3),
                          SizedBox(height: 5),
                          ListTile(
                            leading: Icon(
                              Icons.password,
                              color: Colors.orangeAccent,
                            ),
                            title: Text(
                              'Password: ***Hidden',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          SizedBox(height: 5),
                          Divider(color: Colors.blueAccent, thickness: 0.3),
                          SizedBox(height: 5),
                          ListTile(
                            leading: Icon(
                              Icons.location_on_outlined,
                              color: Colors.blueAccent,
                            ),
                            title: Text(
                              'Address: ${user!.address}',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()), // Loading state
    );
  }
}
