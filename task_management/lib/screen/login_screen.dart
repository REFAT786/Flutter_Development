import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/screen/signup_screen.dart';
import '../service/auth_service.dart';
import '../widget/custom_button.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _passwordVisible = false;
  final AuthService authService = AuthService();

  String? _token; // Store token

  // Login function
  void _login() async {
    if(emailController.text.isEmpty||passwordController.text.isEmpty){
      Get.snackbar('Require','All the information');
    }

    try {
      // Login and get the token
      _token = await authService.loginUser(
        emailController.text, passwordController.text,
      );
      // Save token and rememberMe state to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('remember_me', _rememberMe);  // Save "Remember Me" state
      await prefs.setString('token', _token!);  // Save token
        Get.offAll(DashboardScreen());

    } catch (e) {
      Get.snackbar('Error', 'Login failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Login"),backgroundColor: Colors.white,centerTitle:true ,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  Text('Remember Me'),

                ],
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: _login,
                child: CustomButton(buttonText: "Login",),
              ),
              SizedBox(height: 25,),
              TextButton(
                onPressed: () {
                  Get.to(SignupScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: TextStyle(color: Colors.black),),
                    SizedBox(width: 5,),
                    Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

