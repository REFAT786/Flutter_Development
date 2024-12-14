import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/auth_service.dart';
import '../model/user.dart';
import 'login_screen.dart';

class ProfileEditScreen extends StatefulWidget {
  final String? token;
  final User? user;

  ProfileEditScreen({this.token, this.user, Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final AuthService authService = AuthService();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool _isPasswordVisible = false; // Password visibility toggle

  @override
  void initState() {
    super.initState();
    // Initialize fields with existing profile data
    firstNameController.text = widget.user?.firstName ?? '';
    lastNameController.text = widget.user?.lastName ?? '';
    emailController.text = widget.user?.email ?? '';
    passwordController.text = widget.user?.password ?? '';
    addressController.text = widget.user?.address ?? '';
  }

  // Update user profile
  Future<void> _updateProfile() async {
    if (widget.token == null || widget.token!.isEmpty) {
      _redirectToLogin("Token is missing. Please log in again.");
      return;
    }

    try {
      final message = await authService.updateProfile(
        widget.token!,
        firstNameController.text,
        lastNameController.text,
        passwordController.text,
        addressController.text,
      );

      // Show success message using Get.snackbar
      Get.snackbar("Success", message, snackPosition: SnackPosition.TOP);
      // Create an updated User object with new values
      User updatedUser = User(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: widget.user!.email, // Email is not editable
        password: passwordController.text,
        address: addressController.text,
      );
      // Delay navigation to ProfileScreen to ensure Snackbar is shown
      Future.delayed(Duration(seconds: 5), () {
        Get.back(result: updatedUser); // Pass updated user data back to ProfileScreen
      });


    } catch (e) {
      _showSnackbar("Error", "Failed to update profile: $e");
    }
  }

  // Wait until Snackbar is dismissed before navigating back
  Future<void> _navigateBackAfterSnackbar() async {
    // Wait until the Snackbar has been displayed for a dynamic amount of time
    await Future.delayed(Duration(seconds: 1)); // Wait for Snackbar visibility

    // After Snackbar has been shown, navigate back with the updated user data
    Get.back(result: User(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: widget.user!.email, // Email is not editable
      password: passwordController.text,
      address: addressController.text,
    ));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("Edit Profile", style: TextStyle(color: Colors.black)),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Name Input
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(labelText: 'First Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),),
              ),
              SizedBox(height: 15,),
              // Last Name Input
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(labelText: 'Last Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),),
                enabled: false, // Email is not editable
              ),
              SizedBox(height: 15,),
              // Password Input with visibility toggle
              TextField(
                controller: passwordController,
                obscureText: !_isPasswordVisible, // Toggle visibility
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 15,),

              // Address Input
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),),
              ),
              SizedBox(height:30),
              // Update Profile Button
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: WidgetStatePropertyAll(Colors.blueAccent),elevation: WidgetStatePropertyAll(1),
                    backgroundColor: WidgetStatePropertyAll(Colors.white70),
                    padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 30, vertical: 17)),
                  ),
                  onPressed: _updateProfile,
                  child: Text('Update Profile',style: TextStyle(color: Colors.black),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
